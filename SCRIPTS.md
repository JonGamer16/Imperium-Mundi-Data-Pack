# Bun scripts

Helper scripts, run with [Bun](https://bun.sh). Open a terminal in VS Code with ``Ctrl+` ``, `cd` into
the pack folder shown, and run the command. Add a row here when you add a script.

| Script | Run from | What it does |
| --- | --- | --- |
| `scripts/build_items.ts` | `! Imperium SMP` | Builds SMP items' recipes and loot tables from `scripts/items/` |
| `scripts/deploy.ts` | `! Imperium Kit PVP` | Uploads the pack to the old build server *(Summit-era, likely outdated)* |

## build_items.ts — SMP items

```sh
cd "! Imperium SMP"
bun scripts/build_items.ts           # build once
bun --watch scripts/build_items.ts   # rebuild on every save (Ctrl+C to stop)
```

Edit items in `scripts/items/` only. The recipe and loot-table JSON it writes is overwritten on every run.

| File | Holds | Writes |
| --- | --- | --- |
| `items/weapons.ts` | Melee weapons | `recipe/<name>.json`, `loot_table/smp_weapons/<name>.json` |
| `items/armor.ts` | Armor sets (one entry = 4 pieces) | `recipe/<set>_<piece>.json`, `loot_table/smp_armor/...` |
| `items/misc.ts` | Tools and everything else | `recipe/<name>.json`, `loot_table/smp_misc/...` |

A weapon (misc items take the same fields):

```ts
diamond_dagger: {
    name: "Diamond Dagger", base: "diamond_sword",
    damage: 5, speed: 2,          // final tooltip values (diamond sword = 7, 1.6)
    reach: -0.3, knockback: -0.5, // raw modifier amounts (+/- blocks; multiplier of base)
    minCharge: 1,                 // minimum_attack_charge (kb sets 0.85 unless given)
    kb: { horizontal: 30, vertical: 0 },                 // Knockback Control: adds enchant + tooltip line
    enchantments: { sharpness: 1 },
    lore: ["A gray tooltip line"],
    recipe: { pattern: ["  d", " d ", "s  "], key: { s: "stick", d: "diamond" } },
    components: { max_damage: 500 },                     // any other component, raw 26.3 JSON
},
```

An armor set:

```ts
bronze: {
    name: "Bronze", base: "iron",          // "Bronze Helmet", built on iron_helmet, ...
    armor: [2, 5, 4, 1],                   // helmet, chestplate, leggings, boots
    toughness: 0, knockbackResistance: 0,  // per piece
    enchantments: { protection: 1 },       // on every piece
    material: "copper_ingot",              // vanilla armor recipe shapes
    pieces: { helmet: { lore: ["Keeps the sun off"] } }, // per-piece overrides
},
```

- Every field is listed with a comment in the `Handheld` and `ArmorSet` types in `build_items.ts`.
  VS Code flags misspelled field names.
- `components` wins over anything the shorthand fields generate.
- For a non-shaped recipe, give the full recipe object with its `type`. The script fills in `result`.
- Leave out `recipe` for an item that only exists as a loot table (`/loot give @s loot imperium:smp_weapons/<name>`).
- Removing an item doesn't delete its files. The build prints them (`? no longer generated ...`) for
  you to delete. `scripts/generated_files.json` is its record of what it made, so don't edit it.

## deploy.ts — build server upload *(probably outdated)*

```sh
cd "! Imperium Kit PVP"
bun run scripts/deploy.ts
```

Zips the Kit PVP pack, uploads it to the MCSManager build server, and sends `/reload`. It reads
credentials from `.env` in the Kit PVP folder (`MCS_MANAGER_*`). Flags:

- `--no-shim`: skip the Summit test shim.
- `--shim-only`: upload only the shim.
- `--scl-only`: only update Summit Core Library.

It was written for the Smithed Summit booth, which is retired. It uploads only Kit PVP, not Core or
SMP, and expects `booth_definition/`. Check it before relying on it.
