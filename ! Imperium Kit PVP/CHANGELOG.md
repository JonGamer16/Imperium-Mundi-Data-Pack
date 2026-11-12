# Changelog

Newest first. Dates are when the change was made in the test world. The matching commit, once
there is one, carries the same date in its title.

## 2026-11-11 — SMP shields + Deflection enchantment *(Deflection tested on mobs; rest untested)*

- `imperium:deflection` (Core, shields): when you block a melee hit holding a Deflection shield,
  the attacker (player or mob) takes one standing vanilla hit's knockback away from you. No damage.
  Built on `kb_control_rebuild`, so it respects knockback resistance. Trigger:
  `advancement/enchantments/deflection_block` (`entity_hurt_player`, `blocked`, direct only).
- SMP shields in `scripts/items/misc.ts`: Buckler (sprint while blocking, Fencer's 50% / 60° block),
  Kite (Deflection, 90° arc), Heater (0.1 s raise, 90° arc, lets knockback through), Lantern
  (+4 toughness, +0.5 damage in either hand, 6 damage / 1.6 speed in the main hand, 90° arc, lets
  knockback through). "Lets knockback through" = blocks 99.9%, not 100%: unconfirmed in game.

## 2026-11-08 — True Shot bow enchantment, in Core *(tested 2026-11-09: full draws stack)*

- `imperium:true_shot` (bows): arrows ignore the shooter's momentum and vanilla's random spread.
  The arrow is re-aimed along the shooter's view at the speed the draw earned (vanilla's power
  curve, full at 20 ticks); gravity and drag are unchanged.
- Draw time comes from a `using_item` advancement (`enchantments/true_shot_draw`) that records the
  game tick a draw started; no tick function. Mobs, or a shot without a draw record, stay vanilla.
- Debug: `/function imperium:test/toggle_true_shot_trace` prints each step per arrow.

## 2026-11-05 — Legacy enchantments back, in Core *(all untested)*

- 20 enchantments from `legacy/mundi-2026` ported to 26.3 under `imperium:legacy/<name>`
  (`enchantment/legacy/`, `function/enchantments/legacy/`). They work without kits.
  `/function imperium:test/legacy_give` hands out a test item for each.
- Condition-only: Aerial Ace, Ash Cutter, Brick Smash, Flammable, Low Stance, Magic Protection, Melee
  Protection, Rage, Sneak Guard, Spring, Thrust. With functions: Barbs, Chinks, Embrittlement, Life
  Steal, Power Smash, Shield Pierce, Temper, Tipper, Touch of Death.
- Not ported: Backstab, Crits, Single Use, Two-Handed (already in Core); Light (replaced by Knockback
  Control + the `imperium:light` damage type); Rapid (unfinished); the 6 vanilla enchantment overrides.
- Rebuilt rather than copied, because the old version couldn't work or was costly:
  - Temper: modifier on the player, not rewritten onto the held item each tick through a minecart.
  - Embrittlement: reads the damage_taken stat on hit, sets item damage directly, no minecart.
  - Chinks: measures max durability, so it works on vanilla-durability items. Updates once a second.
  - Barbs: bobbers are marked by `projectile_spawned` and credited to their caster, no proximity guess.
  - Life Steal: heals from damage dealt with the weapon out; 10 clouds' worth of copies became one macro.
  - Tipper: stops at the first target, skips the line with nothing near.
  - Sneak Guard: blindness comes from the enchantment; no cloud per piece per tick.
- Spring and Sneak Guard now work only when worn (were `any` slot, so holding them counted).

## 2026-11-02 — SMP items built from one source

- SMP items are now defined in `! Imperium SMP/scripts/items/` (`weapons.ts`, `armor.ts`, `misc.ts`)
  and written to recipes + loot tables by `scripts/build_items.ts`. Replaces `sync_items.ts`.
- Armor sets: one entry makes all four pieces, with per-piece armor values, set-wide enchantments and
  vanilla armor recipe shapes.
- Fixed: the Diamond Glaive's name was a JSON string and showed as raw text.
- Knockback Control is in `#minecraft:curse` (Core) so a grindstone keeps it. Its description sets
  `color: gray`, which should keep the tooltip from turning red. *(untested)*
- `build_items.ts`: `damage` and `speed` are now final tooltip values (written as vanilla's
  `base_attack_damage` / `base_attack_speed` modifiers, so the tooltip shows green totals).
- Moved to Core so SMP items can use them: damage type `imperium:light` (+ its `bypasses_cooldown`
  entry) and the Offhand Attack enchantment. Its bonus hit is now credited to whoever attacked (was
  Smokey-only), and Core's tick counts `im_offhandCd` down for every player (was Smokey's loop_kit).
- Ported Two-Handed (`imperium:two_handed_curse`, a curse) from the legacy pack to Core, in 26.3 format.
- SMP weapons: 11 diamond weapons with full-charge/bypass-cooldown (rapier, drill), stackable
  unbreakable javelin, half-damage blocking saber, Two-Handed heavies, and Offhand Attack + Crits 2
  on the dagger. *(untested)*

## 2026-10-31 — Knockback Control on player victims *(untested)*

- Players can't be scaled like mobs: vanilla sends their knockback to the client and resets the
  server's copy before `post_attack`, and any push replaces what the client got. `kb_control_player`
  rebuilds vanilla's knockback (`kb_control_rebuild`), scales it, and pushes by the difference.
  Constants from a still husk: 0.45 standing, 0.95 sprinting, 0.4 lift.
- The sprint bonus can't be read after the hit (every attack resets sprint, charge is hidden, misses
  are invisible). So Knockback Control weapons get `minimum_attack_charge` 0.85 (added by
  `sync_items.ts` when missing), and the enchantment's tick effect records sprinting while held
  (`kb_control_sprint`, `im.kbSprint`). Sprinting last tick + a landed hit = sprint bonus.
- Weapons at 100% / +0 leave player victims untouched (exact vanilla).
- Debug: `test/toggle_kb_trace` prints vanilla vs rebuilt knockback on mob hits (use a still NoAI husk).
- To check: whether vanilla's sprint threshold is 85% or 90% charge, and shield-blocked hits.

## 2026-10-29 — Knockback Control

- New Core enchantment `imperium:knockback_control` (`enchantments/kb_control*`). On a player's melee hit
  it scales the knockback vanilla already applied (`post_attack` runs after it, verified 2026-10-28),
  so sprint hits, uncharged hits and the Knockback enchantment keep working at the new strength.
- Per-weapon numbers live in the weapon's `custom_data`: `"{imperium_kb:{horizontal:30,vertical:0}}"`.
  `horizontal` is the % of vanilla knockback kept (negative pulls in); `vertical` adds lift as a %
  of 0.4 b/t. Mobs get `Motion` written; players go through the motion library *(player victims untested)*.
- **The weapon needs the enchantment too**, or the numbers do nothing. `sync_items.ts` adds it, plus
  a gray tooltip line, to any SMP weapon with `imperium_kb`. Hand-made items need it added by hand.
- Diamond Dagger: 30% knockback. It also keeps its `attack_knockback` −50% modifier, so the two stack.
- Test tool: `/function imperium:test/kb_test_give` gives a 30% rapier, a pulling scythe and a launching spade.
- Tested on mobs: all three test weapons.

## 2026-10-28 — Pack split: Core / Kit PvP / SMP

- The one pack is now three folders in `datapacks/`: `! Imperium Core`, `! Imperium Kit PVP` (renamed
  from `! Imperium Booth 26.2`) and `! Imperium SMP`. The git repository moved up to `datapacks/`.
- Core: 45 files (motion library, 11 self-contained enchantments + their functions, `core/*`,
  constants, `floating`, `motion/falling_creative`, `#imperium:human`, `volley_reset`). SMP: the 3 recipes.
- Kit PvP now **requires Core**. Tags split so each pack lists only its own IDs.
- Tested: kits play as before with all three packs loaded. SMP recipes craft; Levent's High Jump
  items, the crossbow enchantments and Straight Flight's 10 s despawn all work with Kit PvP
  disabled, both with and without SMP. Core runs on its own.

## 2026-10-28 — Split step 2 (core load/tick) + Mummy head skin

### Split step 2 *(High Jump tested; the rest untested)*

- Removed the 10 temporary `test/probe_*` advancement and function files.

- New `core/load`, `core/tick`, `core/second`, registered in `#minecraft:load` / `#minecraft:tick`.
  `main` calls `core/load` first. Core's objectives (`im.temp`, `im.motion`, backstab, high jump,
  `im_arrowAge`) moved out of `main`, `main/enchantments` and `main/game_triggers`.
- High Jump's unequip watchdog moved from `kits/levent/loop_kit` to `core/tick`, so it works without
  a kit. It must run once per tick only.
- Straight Flight arrows are aged by `core/second` via their own `im.straight_flight` tag; kit
  `loop_1s` skips them so they still last 10 s.

### Mummy head

- `profile="Mummy"` looked up a live Mojang account, which timed out and showed the default skin.
  All three heads (`kits/mummy/givekit`, `booth/dummy/respawn`, `loot_table/mummy/display/head`)
  now use `profile={texture:"imperium:entity/mummy"}`, from the world resource pack in
  `<world>/resources/` (not in this repo). Tested with the pack enabled client-side.
- The world's `resources.zip` is not applied in 26.3 singleplayer; enable the pack from
  `.minecraft/resourcepacks/` instead. Without it, the head shows the default skin.

### Known issues

- Booth Discord/GitHub icons: the `imperium:icons` font points at `textures/item/discord.png` and
  `github.png`, which aren't in the resource pack. Left alone for now.

## 2026-10-27 — 26.3 port + debug pass

Ported to Minecraft Java **26.3** (data pack format 121) for the pack collab, then played through
every kit and fixed what came up. Everything below has been tested in-game unless marked
*(untested)*.

### Port to 26.3

- `pack.mcmeta` declares `min_format: [121, 0]`, `max_format: 121`. Since 1.21.9 these two fields are
  required, and `pack_format` / `supported_formats` must be left out.
- **111 JSON files migrated by script.** That covers 9 enchantments, 15 predicates, all 32
  advancements, 64 loot tables and 1 item modifier.
  - Loot conditions: `condition` → `type`.
  - `minecraft:reference` → a bare predicate ID string.
  - Lists of conditions → `all_of`.
  - The entity-predicate shorthand in advancement fields → an explicit `entity_properties`.
  - `value_check` → `int_value_check`, with `range` → `test`.
  - Loot tables: `function` → `type`, `functions` → `modifier`, `conditions` → `condition`.
- **Fixed by hand:**
  - The `marked` enchantment's `requirements` was a list. It's a single condition now.
  - Block-state NBT `Name` / `Properties` → `id` / `properties`, in `booth_entities/fake_blocks`
    and `livvy/web_init`.
  - Damage-type tag checks need a `#` now: `#minecraft:no_impact` in `venom_bite`, and
    `#imperium:kinetic` in `use_kinetic_weapon`. The second one meant Smokey's kinetic charge
    never fired.
  - Smokey's givekit failed to load. The `swing_animation` component was removed and replaced by
    `attack_animation` + `interact_animation`. Both items now set both, which keeps the 26.2 look.
- Checked against every other 26.3 breaking change (`map_color`, `pot_decorations`, the
  `potion_contents` predicate, multi-slot `/item replace`, sign click events, recipe
  `cookingtime`, ...). None of them affect this pack.
- `spyglass.json` now targets game version 26.3.

### Cooldown engine

- **Fixed: "you have to take damage before cooldowns move."** `combat/cooldown_dealt` only fired
  on human targets, but the `damage_dealt` stat counts every target. Damage dealt to mobs piled up
  in `im_abilityDealt` until the next `cooldown_taken` run spent all of it at once.
- **New rule: every target charges cooldowns.** Hits on `#imperium:human` (players, mannequins,
  the dummy husk) count 1:1. Any other mob counts **1/3**. Damage taken stays 1:1.
  - `combat/cooldown_dealt` fires on any target.
  - The new `combat/cooldown_dealt_human` tags hits on humans.
  - The engine runs **one tick later**, from `internal/cooldown_flush` →
    `cooldown_dealt_apply`. The trigger may fire before vanilla adds the hit to the stat, so the
    delay makes sure the hit is counted.
  - A sweep that hits a human and a mob in the same tick counts entirely as human.
- `update_cooldowns` creates the two damage scores at 0 if they're missing. Subtracting a score
  that doesn't exist fails, which froze cooldowns for players who had never taken damage.
- **New: `util/rearm_triggers`.** It revokes every self-revoking `imperium:` advancement by name,
  and runs on load and on every kit equip. An advancement whose reward function failed (during
  the port, for example) stays granted forever, and its trigger silently stops working. Smokey's
  break-reel launch and Levent's first reversal both started working after it was added. It most
  likely cleared stuck triggers, but that wasn't confirmed directly.
  **Add a line to it whenever you add an advancement.**

### Kit changes

- **Smokey — Marking Dart** marks any mob it hits, not just players. That includes the dummy and
  golems, and survival mobs later. The red mark particles are now shown to everyone holding a kit,
  not only FFA fighters. *(untested)*
- **Mummy — Grapple Rod** no longer hooks things it only touched. A target counts as hooked only
  if the bobber is on its center line (within 0.4 blocks on each horizontal axis) and 0.3–3
  blocks above its feet. See `kits/mummy/mgrapple_hook_test`. The old check counted anyone whose
  hitbox came within half a block of the bobber.
- **Rastus — combo tax.** Landing `#ComboHits` (3) hits within `#ComboWindow` (20 ticks) of the
  first one spends 1 dash. At 0 dashes, the rapier drops to about 2 attacks/s (a −75% player
  attack-speed modifier, `imperium:combo_slow`) until a dash recharges. Only landed hits count;
  this is intentional.

### Test tools (`function/test/`)

| Function | What it does |
|---|---|
| `test/toggle_zone` | Flips `#ZoneBypass im.dmg`. While on, `imperium:ability_zone` passes for every player, kit or not. |
| `test/toggle_cd_trace` | Flips `#CdTrace im_debug_mode`. While on, each engine run prints its trigger, the hit weighting and its inputs, and the grapple break path prints too. |
| `test/cd_trace` | Prints one line with the cooldown engine's inputs for `@s`. |

Both toggles keep their value across `/reload`. Turn them off before a real session.

### World settings

- **`main` now runs `gamerule natural_health_regeneration false`.** The `loop_1s` regen comment always
  said this line existed, but it was missing, so natural regen was on during fights. Kit PvP only:
  after the split it stays in the kit PvP pack's load. *(untested)*

### Housekeeping

- The Smithed Summit constraints are retired. The pack is a standalone game now, so the
  "never touch other booths' entities" rule no longer applies. Some code comments still mention
  it; they can be cleaned up during the pack split.
- `advancement/test/probe_*` and `function/test/probe_*` are temporary debugging probes. Move them
  out before the split.
