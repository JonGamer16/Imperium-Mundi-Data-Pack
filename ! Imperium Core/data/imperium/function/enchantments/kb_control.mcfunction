# Knockback Control: scales the knockback vanilla just gave @s (the victim) by the attacking
# weapon's own numbers. post_attack runs after vanilla applied this hit's knockback (verified
# 2026-10-28), so sprint hits, uncharged hits, the Knockback enchantment and knockback resistance
# are all already in @s's Motion. Scaling the result keeps every one of them, at a new strength.
#
# The weapon carries the numbers in custom_data (SNBT ints, so macros read them as ints):
#   custom_data="{imperium_kb:{horizontal:30,vertical:0}}"
#   horizontal  % of vanilla horizontal knockback kept: 100 vanilla, 30 light, 0 none, -50 pulls in
#   vertical    extra upward push, % of a normal hit's 0.4 b/t lift: 50 launches, -100 flattens
# SMP weapons get the enchantment and their tooltip line from scripts/sync_items.ts.
# Melee by players only (the enchantment's requirement): a mob attacker has no SelectedItem.

tag @s add im.kb_victim
execute on attacker run function imperium:enchantments/kb_control_read with entity @s SelectedItem.components."minecraft:custom_data".imperium_kb
tag @s remove im.kb_victim
