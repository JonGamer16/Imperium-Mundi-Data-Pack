# Rebuild vanilla's knockback for this hit, as the victim, into #kbKx/#kbKy/#kbKz (1/10000 b/t),
# from the pre-hit velocity in #kbX/#kbY/#kbZ. Constants measured in 26.3 on a still husk
# (2026-10-30): standing hit 0.45 horizontal, sprint hit 0.95, lift 0.4 either way. So one push of
#   horizontal: old/2 + 0.45 away from the attacker + 0.005 x #kbE along the attacker's facing
#   vertical:   on ground min(0.4, old/2 + total strength), in the air unchanged
# with every strength scaled by (1 - knockback_resistance).
execute store result score #kbR im.temp run attribute @s minecraft:knockback_resistance get 1000
scoreboard players set #t im.temp 1000
scoreboard players operation #kbR im.temp < #t im.temp
scoreboard players operation #t im.temp -= #kbR im.temp

# Strengths: base #kbS = 4500, extra #kbS2 = 50 x #kbE, each x (1000 - resistance) / 1000.
scoreboard players set #kbS im.temp 4500
scoreboard players operation #kbS im.temp *= #t im.temp
scoreboard players operation #kbS im.temp /= #1000 im.motion
scoreboard players operation #kbS2 im.temp = #kbE im.temp
scoreboard players operation #kbS2 im.temp *= #t im.temp
scoreboard players operation #kbS2 im.temp /= #20 imperium.const

# Away from the attacker: the unit vector toward them (x1000), subtracted below.
execute at @s facing entity @e[tag=im.kb_attacker,limit=1] feet rotated ~ 0 summon minecraft:marker run function imperium:motion/internal/forward

scoreboard players operation #kbKx im.temp = #kbX im.temp
scoreboard players operation #kbKx im.temp /= #2 imperium.const
scoreboard players operation #t im.temp = #kx im.motion
scoreboard players operation #t im.temp *= #kbS im.temp
scoreboard players operation #t im.temp /= #1000 im.motion
scoreboard players operation #kbKx im.temp -= #t im.temp
scoreboard players operation #t im.temp = #kbFx im.temp
scoreboard players operation #t im.temp *= #kbS2 im.temp
scoreboard players operation #t im.temp /= #1000 im.motion
scoreboard players operation #kbKx im.temp += #t im.temp

scoreboard players operation #kbKz im.temp = #kbZ im.temp
scoreboard players operation #kbKz im.temp /= #2 imperium.const
scoreboard players operation #t im.temp = #kz im.motion
scoreboard players operation #t im.temp *= #kbS im.temp
scoreboard players operation #t im.temp /= #1000 im.motion
scoreboard players operation #kbKz im.temp -= #t im.temp
scoreboard players operation #t im.temp = #kbFz im.temp
scoreboard players operation #t im.temp *= #kbS2 im.temp
scoreboard players operation #t im.temp /= #1000 im.motion
scoreboard players operation #kbKz im.temp += #t im.temp

scoreboard players operation #kbKy im.temp = #kbY im.temp
execute unless predicate {type:"minecraft:entity_properties",entity:"this",predicate:{flags:{is_on_ground:true}}} run return 0
scoreboard players operation #kbKy im.temp /= #2 imperium.const
scoreboard players operation #kbKy im.temp += #kbS im.temp
scoreboard players operation #kbKy im.temp += #kbS2 im.temp
scoreboard players set #t im.temp 4000
scoreboard players operation #kbKy im.temp < #t im.temp
