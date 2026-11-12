# Deflection: reward of imperium:enchantments/deflection_block, as a player who just blocked a
# direct (melee) hit while holding a Deflection shield. Knocks the attacker back with one plain,
# standing vanilla hit's worth of knockback, away from the blocker. No damage.

advancement revoke @s only imperium:enchantments/deflection_block

# kb_control_rebuild pushes away from the entity tagged im.kb_attacker; here that's the blocker.
# Held only for this call, the same way kb_control_read uses it.
tag @s add im.kb_attacker
execute on attacker unless entity @s[tag=im.kb_attacker] run function imperium:enchantments/deflection_push
tag @s remove im.kb_attacker
