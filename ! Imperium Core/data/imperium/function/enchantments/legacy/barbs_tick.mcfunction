# @s = a barbed bobber (from core/tick). Hurt the first mob it reaches, once per cast, credited to
# the caster. Players are skipped, as in the legacy pack.
tag @n[type=!player,type=!#imperium:legacy/not_mob,distance=0.1..1.5] add im.barbs_target
execute unless entity @e[tag=im.barbs_target,limit=1] run return 0
execute on origin run damage @e[tag=im.barbs_target,limit=1] 2 minecraft:player_attack by @s
tag @e[tag=im.barbs_target] remove im.barbs_target
tag @s add im.barbs_spent
