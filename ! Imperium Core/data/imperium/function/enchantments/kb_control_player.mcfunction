# Player victims. Vanilla already sent this hit's knockback to the victim's client and then reset the
# server's copy of their velocity, so #kbX/#kbY/#kbZ is the PRE-hit velocity, and any push replaces
# what the client got instead of adding to it. So: rebuild vanilla's knockback, scale it like the
# mob path does, and push by (wanted - current).
execute if score #kbH im.temp matches 100 if score #kbV im.temp matches 0 run return 0
function imperium:enchantments/kb_control_rebuild

scoreboard players operation $x im.motion = #kbKx im.temp
scoreboard players operation $x im.motion *= #kbH im.temp
scoreboard players operation $x im.motion /= #100 imperium.const
scoreboard players operation $x im.motion -= #kbX im.temp
scoreboard players operation $z im.motion = #kbKz im.temp
scoreboard players operation $z im.motion *= #kbH im.temp
scoreboard players operation $z im.motion /= #100 imperium.const
scoreboard players operation $z im.motion -= #kbZ im.temp
scoreboard players operation $y im.motion = #kbV im.temp
scoreboard players operation $y im.motion *= #40 imperium.const
scoreboard players operation $y im.motion += #kbKy im.temp
scoreboard players operation $y im.motion -= #kbY im.temp
return run function imperium:motion/launch_xyz
