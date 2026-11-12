# To test

Open in-game checks across the three packs, gathered from `! Imperium Kit PVP/CHANGELOG.md`.
Tick an item off here (and in its changelog entry) once it's checked. Kit abilities are tracked
separately in `! Imperium Kit PVP/zz_todo.txt`.

## Needs a second player

- [ ] **Deflection on a player attacker:** they should get pushed back about one normal hit's worth
  (mobs work, 2026-11-11). Goes through the motion library, like Knockback Control's player path.
- [ ] **Knockback Control on player victims:** the rebuilt knockback, the sprint bonus, and hits a
  shield blocks. Weapons at 100% / +0 should feel exactly vanilla.
- [ ] **Heater and Lantern shields letting knockback through:** they block 99.9% of damage instead
  of 100%. Check that a blocked hit still knocks you back. A mob attacker works for this too.

## Single player

- [ ] **SMP shields** (after the next `build_items.ts` run): blocking angles (90° arc), Heater's 0.1 s
  raise, Buckler sprint-blocking, Lantern's toughness / damage in each hand, recipes.
- [ ] **SMP weapons:** the 11 diamond weapons, and Offhand Attack + Crits 2 on the dagger.
- [ ] **Legacy enchantments** (`/function imperium:test/legacy_give`): all 20.
- [ ] **Knockback Control tooltip:** gray, not red, and it survives a grindstone.
- [ ] **Knockback Control sprint threshold:** whether vanilla's sprint-hit cutoff is 85% or 90% charge.
