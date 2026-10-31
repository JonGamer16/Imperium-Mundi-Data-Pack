# Runs as the victim. Velocities in 1/10000 blocks/tick (the motion library's unit).
execute store result score #kbX im.temp run data get entity @s Motion[0] 10000
execute store result score #kbY im.temp run data get entity @s Motion[1] 10000
execute store result score #kbZ im.temp run data get entity @s Motion[2] 10000

execute if entity @s[type=player] run return run function imperium:enchantments/kb_control_player
execute if score #KbTrace im.temp matches 1 run function imperium:enchantments/kb_control_trace

# Mobs: Motion already holds this hit's knockback. Add horizontal * (H - 100) / 100, and V% of a
# 0.4 b/t lift vertically.
scoreboard players operation #kbH im.temp -= #100 imperium.const
scoreboard players operation #kbDX im.temp = #kbX im.temp
scoreboard players operation #kbDX im.temp *= #kbH im.temp
scoreboard players operation #kbDX im.temp /= #100 imperium.const
scoreboard players operation #kbDZ im.temp = #kbZ im.temp
scoreboard players operation #kbDZ im.temp *= #kbH im.temp
scoreboard players operation #kbDZ im.temp /= #100 imperium.const
scoreboard players operation #kbDY im.temp = #kbV im.temp
scoreboard players operation #kbDY im.temp *= #40 imperium.const

scoreboard players operation #kbX im.temp += #kbDX im.temp
scoreboard players operation #kbY im.temp += #kbDY im.temp
scoreboard players operation #kbZ im.temp += #kbDZ im.temp
execute store result entity @s Motion[0] double 0.0001 run scoreboard players get #kbX im.temp
execute store result entity @s Motion[1] double 0.0001 run scoreboard players get #kbY im.temp
execute store result entity @s Motion[2] double 0.0001 run scoreboard players get #kbZ im.temp
