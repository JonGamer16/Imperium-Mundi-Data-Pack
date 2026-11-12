# Deflection, as the attacker whose hit was blocked. Rebuild a standing vanilla hit's knockback
# (no sprint or Knockback bonus, so #kbE = 0) from the current velocity, then apply it.
# Velocities in 1/10000 blocks/tick.
execute store result score #kbX im.temp run data get entity @s Motion[0] 10000
execute store result score #kbY im.temp run data get entity @s Motion[1] 10000
execute store result score #kbZ im.temp run data get entity @s Motion[2] 10000
scoreboard players set #kbE im.temp 0
scoreboard players set #kbFx im.temp 0
scoreboard players set #kbFz im.temp 0
function imperium:enchantments/kb_control_rebuild

# Players ignore Motion writes: push by (wanted - current) through the motion library instead.
execute if entity @s[type=player] run scoreboard players operation $x im.motion = #kbKx im.temp
execute if entity @s[type=player] run scoreboard players operation $x im.motion -= #kbX im.temp
execute if entity @s[type=player] run scoreboard players operation $y im.motion = #kbKy im.temp
execute if entity @s[type=player] run scoreboard players operation $y im.motion -= #kbY im.temp
execute if entity @s[type=player] run scoreboard players operation $z im.motion = #kbKz im.temp
execute if entity @s[type=player] run scoreboard players operation $z im.motion -= #kbZ im.temp
execute if entity @s[type=player] run return run function imperium:motion/launch_xyz

execute store result entity @s Motion[0] double 0.0001 run scoreboard players get #kbKx im.temp
execute store result entity @s Motion[1] double 0.0001 run scoreboard players get #kbKy im.temp
execute store result entity @s Motion[2] double 0.0001 run scoreboard players get #kbKz im.temp
