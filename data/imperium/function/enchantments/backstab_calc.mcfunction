# Pull the target's rotation using hitbox intersection
execute \
    store result score @s im_rotationdiff \
    run data get \
        entity @e[type=!player,type=!#minecraft:im.not_mob,dx=0,dy=0,dz=0,limit=1,sort=nearest] \
        Rotation[0] 1

# Math: Attacker Rotation -= Target Rotation
scoreboard players operation @s im_rotation -= @s im_rotationdiff

# Check bounds for the 120-degree backstab cone
execute \
    if score @s im_rotation matches -60..60 \
    run scoreboard players set @s im_backstabflag 1
execute \
    if score @s im_rotation matches ..-300 \
    run scoreboard players set @s im_backstabflag 1
execute \
    if score @s im_rotation matches 300.. \
    run scoreboard players set @s im_backstabflag 1

# Fail state (Raycast hit a target, but the angle was wrong)
execute \
    if score @s im_backstabflag matches 0 \
    run scoreboard players set @s im_backstabflag 2