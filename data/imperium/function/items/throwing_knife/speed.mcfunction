# Store NBT Motion as scoreboard integers (scaled by 1000 to preserve decimals)
execute store result score @s m_x run data get entity @s Motion[0] 1000
execute store result score @s m_y run data get entity @s Motion[1] 1000
execute store result score @s m_z run data get entity @s Motion[2] 1000

# Multiply by the desired speed factor
scoreboard players operation @s m_x *= #SPEED im_temp
scoreboard players operation @s m_y *= #SPEED im_temp
scoreboard players operation @s m_z *= #SPEED im_temp

# Store the modified scores back into the entity's NBT (divided by 1000)
execute store result entity @s Motion[0] double 0.001 run scoreboard players get @s m_x
execute store result entity @s Motion[1] double 0.001 run scoreboard players get @s m_y
execute store result entity @s Motion[2] double 0.001 run scoreboard players get @s m_z