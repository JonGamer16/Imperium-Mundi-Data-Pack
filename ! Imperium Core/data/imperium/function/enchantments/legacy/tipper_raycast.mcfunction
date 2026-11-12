scoreboard players add @s im_tipperStep 1

# dx=0 twice: true only if the entity's hitbox contains this exact point.
execute as @e[type=!#imperium:legacy/not_mob,tag=!im.tipper_self,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] run scoreboard players set #tipperHit im.temp 1
execute if score #tipperHit im.temp matches 1 run return 0

execute if score @s im_tipperStep < @s im_tipperReach positioned ^ ^ ^0.1 if block ~ ~ ~ #imperium:legacy/raycast_pass run function imperium:enchantments/legacy/tipper_raycast
