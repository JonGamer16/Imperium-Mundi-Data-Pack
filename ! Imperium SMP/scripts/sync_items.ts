// Keeps each SMP weapon's item identical in its two copies:
//   data/imperium/recipe/<name>.json             -> "result"
//   data/imperium/loot_table/smp_weapons/<name>.json -> the single item entry + set_components
// (A 26.3 recipe result can't reference a loot table, so the item has to live in both.)
//
// Edit either copy, then run:   bun scripts/sync_items.ts          (from the SMP pack folder)
// or leave it running:          bun scripts/sync_items.ts --watch
//
// "Which copy is newer" is decided by content, not file times: item_sync_state.json remembers the
// item as of the last sync. The side that differs from it is the edited one and is copied over the
// other. If BOTH sides changed differently, nothing is written and the conflict is reported.
// Files are rewritten with 4-space JSON formatting.
//
// Generated parts: a weapon with imperium_kb in its custom_data gets the Knockback Control enchantment
// and a gray tooltip line added to BOTH copies (see decorate below). Edit the numbers, not those.
// It also gets minimum_attack_charge 0.85 if it has none (your own value is never overwritten, and
// removing imperium_kb leaves it in place).

import { createHash } from "crypto";
import { existsSync, mkdirSync, readdirSync, readFileSync, watch, writeFileSync } from "fs";
import { join } from "path";

const PACK = join(import.meta.dir, "..");
const RECIPES = join(PACK, "data/imperium/recipe");
const LOOT = join(PACK, "data/imperium/loot_table/smp_weapons");
const STATE = join(import.meta.dir, "item_sync_state.json");

type Item = { id: string; count: number; components?: Record<string, unknown> };

const readJson = (p: string) => JSON.parse(readFileSync(p, "utf8"));
const writeJson = (p: string, v: unknown) => writeFileSync(p, JSON.stringify(v, null, 4) + "\n");
const ns = (s: string) => (s.includes(":") ? s : "minecraft:" + s);
const nsKey = (k: string) => (k.startsWith("!") ? "!" + ns(k.slice(1)) : ns(k));

// Hash with sorted keys and namespaced ids, so "diamond_sword" == "minecraft:diamond_sword" and
// component order doesn't count as a change.
function stable(v: unknown): unknown {
    if (Array.isArray(v)) return v.map(stable);
    if (v && typeof v === "object")
        return Object.fromEntries(Object.keys(v).sort().map((k) => [k, stable((v as any)[k])]));
    return v;
}
function hash(item: Item): string {
    const comps = Object.fromEntries(Object.entries(item.components ?? {}).map(([k, v]) => [nsKey(k), v]));
    const canon = { id: ns(item.id), count: item.count, components: comps };
    return createHash("sha1").update(JSON.stringify(stable(canon))).digest("hex");
}

function fromRecipe(r: any): Item {
    const res = r.result;
    if (typeof res === "string") return { id: res, count: 1 };
    return { id: res.id, count: res.count ?? 1, ...(res.components && { components: res.components }) };
}
function toRecipe(r: any, item: Item) {
    r.result = { id: item.id, count: item.count, ...(item.components && { components: item.components }) };
}

// Only the simple shape is mirrored: one pool, one item entry, set_components (+ set_count).
function lootEntry(lt: any) {
    const entries = lt.pools?.length === 1 ? lt.pools[0].entries : undefined;
    if (entries?.length !== 1 || ![`item`, `minecraft:item`].includes(entries[0].type))
        throw new Error("loot table must have exactly one pool with one item entry");
    return entries[0];
}
const modList = (e: any) => (e.modifier === undefined ? [] : Array.isArray(e.modifier) ? e.modifier : [e.modifier]);
const isType = (m: any, t: string) => m.type === t || m.type === "minecraft:" + t;
function fromLoot(lt: any): Item {
    const e = lootEntry(lt);
    const mods = modList(e);
    const other = mods.filter((m: any) => !isType(m, "set_components") && !isType(m, "set_count"));
    if (other.length) throw new Error(`unsupported modifier(s): ${other.map((m: any) => m.type).join(", ")}`);
    const comps = mods.find((m: any) => isType(m, "set_components"))?.components;
    const cnt = mods.find((m: any) => isType(m, "set_count"))?.count;
    const count = cnt === undefined ? 1 : typeof cnt === "number" ? cnt : cnt.value;
    if (typeof count !== "number") throw new Error("set_count must be a constant");
    return { id: e.name, count, ...(comps && { components: comps }) };
}
function toLoot(lt: any | undefined, item: Item) {
    lt ??= { pools: [{ rolls: 1, entries: [{ type: "minecraft:item" }] }] };
    const e = lootEntry(lt);
    e.name = item.id;
    const mods = modList(e).filter((m: any) => !isType(m, "set_components") && !isType(m, "set_count"));
    if (item.components) mods.push({ type: "minecraft:set_components", components: item.components });
    if (item.count !== 1) mods.push({ type: "minecraft:set_count", count: { type: "minecraft:constant", value: item.count } });
    if (mods.length) e.modifier = mods; else delete e.modifier;
    return lt;
}

// Knockback Control (Core enchantment imperium:knockback_control). A weapon opts in with
//   "minecraft:custom_data": "{imperium_kb:{horizontal:30,vertical:0}}"
// and this adds the enchantment plus a tooltip line describing the numbers; remove imperium_kb and
// both go away again. The line is recognised by its "insertion" marker, so other lore is kept.
const KB_ENCH = "imperium:knockback_control";
const KB_MARK = "imperium_kb";
const KB_MIN_CHARGE = 0.85;
const comp = (c: Record<string, any>, k: string) => (("minecraft:" + k) in c ? "minecraft:" + k : k);
function kbNumbers(c: Record<string, any>): { h: number; v: number } | undefined {
    const cd = c[comp(c, "custom_data")];
    const snbt = typeof cd === "string" ? cd : cd === undefined ? "" : JSON.stringify(cd);
    if (!snbt.includes(KB_MARK)) return undefined;
    if (typeof cd !== "string") throw new Error(`write custom_data as an SNBT string so ${KB_MARK} stays ints`);
    const h = snbt.match(/horizontal\s*:\s*(-?\d+)\s*[,}]/), v = snbt.match(/vertical\s*:\s*(-?\d+)\s*[,}]/);
    if (!h || !v) throw new Error(`${KB_MARK} needs whole-number horizontal and vertical, e.g. {horizontal:30,vertical:0}`);
    return { h: +h[1], v: +v[1] };
}
function kbText({ h, v }: { h: number; v: number }): string {
    const parts = [];
    if (h < 0) parts.push(`Pulls targets in (${-h}%)`);
    else if (h === 0) parts.push("No knockback");
    else if (h !== 100) parts.push(`Knockback: ${h}%`);
    if (v > 0) parts.push(`Launches upward (+${v}%)`);
    else if (v < 0) parts.push(`Flatter knockback (${v}%)`);
    return parts.join(", ") || "Normal knockback";
}
function decorate(item: Item): Item {
    const c: Record<string, any> = structuredClone(item.components ?? {});
    const kb = kbNumbers(c);
    const loreKey = comp(c, "lore"), enchKey = comp(c, "enchantments");
    const lore = ((c[loreKey] ?? []) as any[]).filter((l) => !(l && typeof l === "object" && l.insertion === KB_MARK));
    const ench: Record<string, number> = { ...(c[enchKey] ?? {}) };
    delete ench[KB_ENCH];
    if (kb) {
        lore.unshift({ text: kbText(kb), color: "gray", italic: false, insertion: KB_MARK });
        ench[KB_ENCH] = 1;
        // Player victims rebuild vanilla's sprint bonus, which needs every landed hit charged past the sprint-hit threshold.
        // Added only if missing; a lower value you set yourself is kept (CTS-style sprint hits).
        const chargeKey = comp(c, "minimum_attack_charge");
        if (!(chargeKey in c)) c[chargeKey] = KB_MIN_CHARGE;
    }
    if (lore.length) c[loreKey] = lore; else delete c[loreKey];
    if (Object.keys(ench).length) c[enchKey] = ench; else delete c[enchKey];
    return { id: item.id, count: item.count, ...(Object.keys(c).length && { components: c }) };
}

function sync() {
    const state: Record<string, string> = existsSync(STATE) ? readJson(STATE) : {};
    const names = new Set(
        [RECIPES, LOOT].flatMap((d) => (existsSync(d) ? readdirSync(d) : [])).filter((f) => f.endsWith(".json")).map((f) => f.slice(0, -5)),
    );
    let problems = 0;
    for (const name of [...names].sort()) {
        const rp = join(RECIPES, name + ".json"), lp = join(LOOT, name + ".json");
        try {
            const recipe = existsSync(rp) ? readJson(rp) : undefined;
            const loot = existsSync(lp) ? readJson(lp) : undefined;
            if (recipe && !recipe.result) continue; // not an item recipe (e.g. a special recipe type)
            if (!recipe) { console.warn(`! ${name}: loot table has no recipe; write recipe/${name}.json first`); problems++; continue; }
            const r = fromRecipe(recipe), hr = hash(r);
            const l = loot && fromLoot(loot), hl = l && hash(l);
            // Pick the copy to keep: the only one, the common one, or the one edited since last sync.
            let src = r, note = loot ? "" : "created loot table from recipe";
            if (l && hr !== hl) {
                const rChanged = hr !== state[name], lChanged = hl !== state[name];
                if (rChanged && lChanged) {
                    console.warn(`! ${name}: recipe and loot table were BOTH edited and differ; fix one by hand, then re-run`);
                    problems++; continue;
                }
                [src, note] = rChanged ? [r, "recipe -> loot table"] : [l, "loot table -> recipe"];
            }
            // Generated parts (knockback enchantment + tooltip) are refreshed on both copies.
            const d = decorate(src), hd = hash(d);
            if (hd !== hr) { toRecipe(recipe, d); writeJson(rp, recipe); }
            if (hd !== hl) { mkdirSync(LOOT, { recursive: true }); writeJson(lp, toLoot(loot, d)); }
            if (!note && (hd !== hr || hd !== hl)) note = "updated generated tooltip/enchantment";
            if (note) console.log(`${loot ? ">" : "+"} ${name}: ${note}`);
            state[name] = hd;
        } catch (err) {
            console.warn(`! ${name}: ${(err as Error).message}`); problems++;
        }
    }
    writeJson(STATE, Object.fromEntries(Object.entries(state).sort()));
    console.log(problems ? `sync finished with ${problems} problem(s)` : "items in sync");
}

sync();
if (process.argv.includes("--watch")) {
    let timer: ReturnType<typeof setTimeout> | undefined;
    const kick = () => { clearTimeout(timer); timer = setTimeout(sync, 300); };
    mkdirSync(LOOT, { recursive: true });
    for (const d of [RECIPES, LOOT]) watch(d, kick);
    console.log("watching recipe/ and loot_table/smp_weapons/ (Ctrl+C to stop)");
}
