# Runs as the attacker, with the held weapon's imperium_kb compound as macro arguments.
$scoreboard players set #kbH im.temp $(horizontal)
$scoreboard players set #kbV im.temp $(vertical)

# What vanilla's extra knockback used (for rebuilding it on player victims), x100: the
# attack_knockback attribute, +100 per Knockback level, +100 for a sprint hit. The weapon's
# minimum_attack_charge guarantees every landed hit is charged, so "sprinting last tick" is
# exactly vanilla's sprint-bonus test (every attack resets sprint before post_attack).
execute store result score #kbE im.temp run attribute @s minecraft:attack_knockback get 100
execute store result score #t im.temp run data get entity @s SelectedItem.components."minecraft:enchantments"."minecraft:knockback" 100
scoreboard players operation #kbE im.temp += #t im.temp
execute store result score #t im.temp run time query gametime
scoreboard players operation #t im.temp -= @s im.kbSprint
execute if score #t im.temp matches 0..1 run scoreboard players add #kbE im.temp 100

# Extra knockback pushes along the attacker's horizontal facing: unit vector x1000 in #kbFx/#kbFz.
execute rotated as @s rotated ~ 0 positioned as @s summon minecraft:marker run function imperium:motion/internal/forward
scoreboard players operation #kbFx im.temp = #kx im.motion
scoreboard players operation #kbFz im.temp = #kz im.motion

tag @s add im.kb_attacker
execute as @e[tag=im.kb_victim,limit=1] run function imperium:enchantments/kb_control_apply
tag @s remove im.kb_attacker
