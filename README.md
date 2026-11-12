```
   ________  ____________
  / .      \/           /
 /            .        /
/                     /
\   I M P E R I U M   \
 \                     L
  \      M U N D I      \
  /   .                 /
 /                   . /
/_____/\__________/\__/
```

# Imperium Mundi Data Packs

Minecraft Java **26.3** (data pack format 121). Vanilla only, no mods.

**About:** a vanilla replica of Imperium Mundi, the free-for-all Kit PvP minigame created by
awesomebutter234 and JonGamer16. You pick a kit and fight. The focus is on items and fighting styles
inspired by older Minecraft combat, and on gameplay that pushes the mechanical limits of vanilla
combat. The original game has over 45 kits; this version currently has 7 (Cliffshield, Meowdy,
Livvy, Mummy, Levent, Rastus, Smokey).

The version shown at the Smithed Summit booth is at
[Imperium-Booth-26.2](https://github.com/JonGamer16/Imperium-Booth-26.2). This repo continues from
it as a standalone game.

## The packs

Drop the folders you want into a world's `datapacks/`. They all share the `imperium:` namespace.

| Folder | What it is | Needs |
|---|---|---|
| `! Imperium Core` | Motion library, the self-contained custom enchantments (High Jump, Straight Flight, Knockback Control, ...), shared load/tick | nothing |
| `! Imperium Kit PVP` | The kit PvP game: kits, booth, abilities, cooldown engine, FFA arena | **Core** |
| `! Imperium SMP` | Survival content: craftable weapons (Diamond Dagger, Glaive, Rapier) | Core |
| `legacy/` | The older Mundi pack (game modes, Player DB, more kits, vanilla recipe overrides). **Not loaded**; kept to pull pieces from. See [legacy/README.md](legacy/README.md) | — |

Recent changes are in [`! Imperium Kit PVP/CHANGELOG.md`](<! Imperium Kit PVP/CHANGELOG.md>).
A full map of how the Kit PvP pack works is in [`! Imperium Kit PVP/WIKI.md`](<! Imperium Kit PVP/WIKI.md>).

## Adding to the pack

Paths below are in `! Imperium Kit PVP/data/imperium/` unless noted.

### A kit

1. **Number:** pick an unused `im_givekit` number. See `function/arena/givekit`.
2. **givekit:** in `function/arena/givekit`, remove the new kit tag with the others, then add the
   `tag @s add im.kit_<name>` + `function imperium:kits/<name>/givekit` lines for your number.
3. **Kit folder:** create `function/kits/<name>/` with
   - `givekit`: starts with `function imperium:util/clear_kit`, then gives the items;
   - `abilities`: called by `kit_dispatch` when one of the kit's cooldowns (`im_abilityCd*`) hits 0;
     it hands out the matching `cd1_*` / `cd2_*` / `cd3_*` item;
   - `healing`: the kit's healing items;
   - `loop_kit` (optional): per-tick logic for the kit's mechanics, called from `function/loop_tick`;
   - `booth/`: `click`, `select`, `lore`, `summon` for the kit stand.
4. **Wiring:** add the kit tag to `function/kit_dispatch`, `function/main` (the `im.kitted` line)
   and `function/util/clear_kit`. Search for an existing kit name (e.g. `cliffshield`) to find the
   other spots: booth setup and reset, random select, respawn, heals and loot.
5. **Advancements:** every `imperium:` advancement revokes itself in its reward. Add a line for each
   new one to `function/util/rearm_triggers`.

### An enchantment

- Kit-only enchantments go in Kit PvP. Enchantments that work without a kit go in **Core**
  (`! Imperium Core/data/imperium/enchantment/`), so the SMP pack can use them.
- Enchantment changes don't apply on `/reload`. Quit to the title screen and rejoin.

### An SMP item (weapon, tool, armor)

Full usage, and every other Bun script: [SCRIPTS.md](SCRIPTS.md).

SMP items are defined only in `! Imperium SMP/scripts/items/`: `weapons.ts`, `armor.ts` (one entry
per set makes all four pieces) and `misc.ts` (tools and everything else). Run
`bun scripts/build_items.ts` from the SMP folder (or `bun --watch scripts/build_items.ts`) to write
each item's recipe (`data/imperium/recipe/`) and loot table (`loot_table/smp_weapons/`, `smp_armor/`,
`smp_misc/`). Don't edit the generated JSON. Shorthand fields cover stats, enchantments, lore and
recipes; any other component goes in `components` as raw JSON. Custom knockback is
`kb: { horizontal: 30, vertical: 0 }`, which adds the custom_data, enchantment and tooltip line.

## Testing

Test helpers live in `function/test/` in each pack, for example:

- `/function imperium:test/toggle_zone`: abilities work anywhere, with or without a kit.
- `/function imperium:test/toggle_cd_trace`: prints the cooldown engine's inputs.
- `/function imperium:test/kb_test_give` and `test/toggle_kb_trace`: Knockback Control test weapons
  and trace.

The toggles survive `/reload`; turn them off before a real session.
