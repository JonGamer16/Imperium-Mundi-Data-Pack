// Builds every SMP item from the files in scripts/items/ (the only place items are edited):
//   items/weapons.ts  -> recipe/<name>.json + loot_table/smp_weapons/<name>.json
//   items/armor.ts    -> one recipe + loot table per piece (<set>_helmet, ...) in loot_table/smp_armor/
//   items/misc.ts     -> tools and everything else, loot_table/smp_misc/
// (A 26.3 recipe result can't reference a loot table, so each item is written into both.)
//
// Run from the SMP pack folder:   bun scripts/build_items.ts
// Rebuild on every save:          bun --watch scripts/build_items.ts
//
// The generated JSON is overwritten on every run; don't hand-edit it. Anything the shorthand fields
// don't cover goes in an item's `components` (raw 26.3 component JSON, wins over the generated ones).
// Removing an item doesn't delete its files: the run lists them (from generated_files.json) to delete.

import { existsSync, mkdirSync, readFileSync, writeFileSync } from "fs";
import { dirname, join } from "path";

const PACK = join(import.meta.dir, "..");
const DATA = join(PACK, "data/imperium");
const MANIFEST = join(import.meta.dir, "generated_files.json");

export type Components = Record<string, unknown>;
export type Lore = string | Record<string, unknown>; // a string is a gray, non-italic line
// A shaped recipe ({pattern, key}), or any full recipe object with a "type" (its result is filled in).
export type Recipe = { pattern: string[]; key: Record<string, unknown>; category?: string } | ({ type: string } & Record<string, unknown>);
export type Knockback = { horizontal: number; vertical: number };

type Common = {
    name: string;                          // item_name
    base: string;                          // vanilla item it's built on, e.g. "diamond_sword"
    count?: number;
    enchantments?: Record<string, number>; // { protection: 2, "imperium:foo": 1 }
    enchantable?: number;                  // enchanting-table enchantability
    lore?: Lore[];
    recipe?: Recipe;                       // omit for a loot-table-only item
    components?: Components;
};

// Held items (weapons, tools, misc). Stats become mainhand attribute modifiers (setting any replaces
// ALL of the base item's own). damage and speed are the final tooltip values; the rest are raw amounts.
export type Handheld = Common & {
    damage?: number;    // final attack damage, as the tooltip shows it (diamond sword = 7)
    speed?: number;     // final attacks per second, as the tooltip shows it (sword = 1.6)
    reach?: number;     // entity_interaction_range, add_value (base 3: 1 here = 4 blocks)
    knockback?: number; // attack_knockback, add_multiplied_base (-0.5 = half)
    sweep?: number;     // sweeping_damage_ratio, add_value
    attributes?: Record<string, unknown>[]; // extra raw attribute modifiers, appended
    kb?: Knockback;     // Knockback Control (Core): adds custom_data, the enchantment and a tooltip line
    minCharge?: number; // minimum_attack_charge; defaults to 0.85 when kb is set
};

export const PIECES = ["helmet", "chestplate", "leggings", "boots"] as const;
export type Piece = (typeof PIECES)[number];
const SLOT: Record<Piece, string> = { helmet: "head", chestplate: "chest", leggings: "legs", boots: "feet" };
const ARMOR_PATTERN: Record<Piece, string[]> = {
    helmet: ["XXX", "X X"], chestplate: ["X X", "XXX", "XXX"], leggings: ["XXX", "X X", "X X"], boots: ["X X", "X X"],
};

// One entry makes four items, <set>_helmet ... <set>_boots, each built on <base>_<piece>.
export type ArmorSet = Omit<Common, "base" | "recipe"> & {
    base: string;                             // vanilla material prefix: "iron" -> iron_helmet, ...
    armor: [number, number, number, number];  // helmet, chestplate, leggings, boots
    toughness?: number;                       // per piece
    knockbackResistance?: number;             // per piece (0.1 = 10%)
    attributes?: Record<string, unknown>[];   // extra raw modifiers on every piece (slot is filled in)
    material?: string;                        // ingredient for the vanilla armor recipe shapes
    // Per-piece overrides; name defaults to "<set name> Helmet" etc. components merge over the set's.
    pieces?: Partial<Record<Piece, Partial<Common>>>;
};

// ---- Knockback Control (Core enchantment imperium:knockback_control) ----
const KB_ENCH = "imperium:knockback_control";
const KB_MARK = "imperium_kb";
const KB_MIN_CHARGE = 0.85;
function kbText({ horizontal: h, vertical: v }: Knockback): string {
    const parts = [];
    if (h < 0) parts.push(`Pulls targets in (${-h}%)`);
    else if (h === 0) parts.push("No knockback");
    else if (h !== 100) parts.push(`Knockback: ${h}%`);
    if (v > 0) parts.push(`Launches upward (+${v}%)`);
    else if (v < 0) parts.push(`Flatter knockback (${v}%)`);
    return parts.join(", ") || "Normal knockback";
}

// ---- building ----
type Item = { id: string; count: number; components: Components };
const ns = (s: string) => (s.includes(":") ? s : "minecraft:" + s);
const bare = (k: string) => k.replace(/^(!?)minecraft:/, "$1");
const loreLine = (l: Lore) => (typeof l === "string" ? { text: l, color: "gray", italic: false } : l);
const mod = (type: string, amount: number, slot: string, id: string, operation = "add_value") => ({ type, amount, operation, slot, id });

function common(c: Common, attrs: unknown[], extra: Components = {}): Item {
    const comps: Components = { item_name: c.name };
    if (attrs.length) comps.attribute_modifiers = attrs;
    Object.assign(comps, extra);
    const lore = [...((extra.lore as unknown[]) ?? []), ...(c.lore ?? []).map(loreLine)];
    if (lore.length) comps.lore = lore;
    const ench = { ...(extra.enchantments as Record<string, number>), ...c.enchantments };
    if (Object.keys(ench).length) comps.enchantments = Object.fromEntries(Object.entries(ench).map(([k, v]) => [ns(k), v]));
    if (c.enchantable !== undefined) comps.enchantable = { value: c.enchantable };
    for (const [k, v] of Object.entries(c.components ?? {})) comps[bare(k)] = v;
    return { id: c.base, count: c.count ?? 1, components: comps };
}

// Player base values. The base_attack_* ids make the tooltip show the green total, like vanilla tools.
const BASE_DAMAGE = 1, BASE_SPEED = 4;
const round = (n: number) => Math.round(n * 1e6) / 1e6; // 1.6 - 4 = -2.4000000000000004 otherwise

function handheld(w: Handheld): Item {
    const m = (t: string, a: number | undefined, op?: string, id = t) => (a === undefined ? [] : [mod(t, a, "mainhand", id, op)]);
    const fromFinal = (v: number | undefined, base: number) => (v === undefined ? undefined : round(v - base));
    const attrs = [
        ...m("attack_damage", fromFinal(w.damage, BASE_DAMAGE), undefined, "base_attack_damage"),
        ...m("attack_speed", fromFinal(w.speed, BASE_SPEED), undefined, "base_attack_speed"),
        ...m("entity_interaction_range", w.reach),
        ...m("attack_knockback", w.knockback, "add_multiplied_base"), ...m("sweeping_damage_ratio", w.sweep), ...(w.attributes ?? []),
    ];
    const extra: Components = {};
    if (w.kb) {
        if (w.components && Object.keys(w.components).some((k) => bare(k) === "custom_data"))
            throw new Error("kb writes custom_data; put other custom_data in the kb string by hand instead");
        extra.custom_data = `{${KB_MARK}:{horizontal:${w.kb.horizontal},vertical:${w.kb.vertical}}}`;
        extra.lore = [{ text: kbText(w.kb), color: "gray", italic: false, insertion: KB_MARK }];
        extra.enchantments = { [KB_ENCH]: 1 };
    }
    // Player victims rebuild vanilla's sprint bonus, which needs every landed hit charged past the sprint-hit threshold.
    const charge = w.minCharge ?? (w.kb ? KB_MIN_CHARGE : undefined);
    if (charge !== undefined) extra.minimum_attack_charge = charge;
    return common(w, attrs, extra);
}

function armorPieces(key: string, s: ArmorSet): [string, Item, Recipe | undefined][] {
    return PIECES.map((p, i) => {
        const over = s.pieces?.[p] ?? {};
        const slot = SLOT[p];
        const attrs = [
            mod("armor", s.armor[i], slot, `armor.${p}`),
            ...(s.toughness ? [mod("armor_toughness", s.toughness, slot, `armor_toughness.${p}`)] : []),
            ...(s.knockbackResistance ? [mod("knockback_resistance", s.knockbackResistance, slot, `knockback_resistance.${p}`)] : []),
            ...(s.attributes ?? []).map((a) => ({ slot, ...a })),
        ];
        const piece: Common = {
            ...s, ...over,
            name: over.name ?? `${s.name} ${p[0].toUpperCase()}${p.slice(1)}`,
            base: over.base ?? `${s.base}_${p}`,
            components: { ...s.components, ...over.components },
        };
        const recipe = over.recipe ?? (s.material ? { pattern: ARMOR_PATTERN[p], key: { X: s.material } } : undefined);
        return [`${key}_${p}`, common(piece, attrs), recipe];
    });
}

function recipeJson(r: Recipe, item: Item) {
    const result = { id: item.id, count: item.count, components: item.components };
    if ("type" in r) return { ...r, result };
    return { type: "crafting_shaped", category: r.category ?? "equipment", pattern: r.pattern, key: r.key, result };
}
function lootJson(item: Item) {
    const modifier: unknown[] = [{ type: "minecraft:set_components", components: item.components }];
    if (item.count !== 1) modifier.push({ type: "minecraft:set_count", count: { type: "minecraft:constant", value: item.count } });
    return { pools: [{ rolls: 1, entries: [{ type: "minecraft:item", name: item.id, modifier }] }] };
}

// ---- run ----
const written: string[] = [];
let problems = 0;
function write(rel: string, v: unknown) {
    const p = join(DATA, rel), text = JSON.stringify(v, null, 4) + "\n";
    written.push(rel);
    if (existsSync(p) && readFileSync(p, "utf8") === text) return;
    mkdirSync(dirname(p), { recursive: true });
    writeFileSync(p, text);
    console.log(`> ${rel}`);
}
const seen = new Set<string>();
function emit(name: string, folder: string, item: Item, recipe: Recipe | undefined) {
    if (seen.has(name)) throw new Error(`${name} is defined twice`);
    seen.add(name);
    write(`loot_table/${folder}/${name}.json`, lootJson(item));
    if (recipe) write(`recipe/${name}.json`, recipeJson(recipe, item));
}
function each<T>(file: string, items: Record<string, T>, build: (name: string, v: T) => void) {
    for (const [name, v] of Object.entries(items)) {
        try { build(name, v); } catch (err) { console.warn(`! ${file}: ${name}: ${(err as Error).message}`); problems++; }
    }
}

const { default: weapons } = await import("./items/weapons.ts");
const { default: armor } = await import("./items/armor.ts");
const { default: misc } = await import("./items/misc.ts");
each<Handheld>("weapons", weapons, (n, w) => emit(n, "smp_weapons", handheld(w), w.recipe));
each<Handheld>("misc", misc, (n, w) => emit(n, "smp_misc", handheld(w), w.recipe));
each<ArmorSet>("armor", armor, (n, s) => armorPieces(n, s).forEach(([pn, item, r]) => emit(pn, "smp_armor", item, r)));

const before: string[] = existsSync(MANIFEST) ? JSON.parse(readFileSync(MANIFEST, "utf8")) : [];
const stale = before.filter((f) => !written.includes(f) && existsSync(join(DATA, f)));
for (const f of stale) console.warn(`? no longer generated, delete it if the item is gone: data/imperium/${f}`);
// Keep stale entries listed until they're deleted, so the warning repeats.
writeFileSync(MANIFEST, JSON.stringify([...written, ...stale].sort(), null, 4) + "\n");
console.log(problems ? `build finished with ${problems} problem(s)` : `built ${seen.size} item(s)`);
