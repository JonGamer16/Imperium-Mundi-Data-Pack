advancement revoke @s only imperium:consume_knife

# 1. Spawn the Arrow projectile at the player's eyes
execute at @s anchored eyes \
    run summon arrow ^ ^ ^ {\
        Tags:["knife_proj"],\
        pickup:1b,\
        damage:5.0d,\
        item:{\
            id:"minecraft:iron_sword",\
            count:1,\
            components:{\
                "minecraft:custom_data":"{knife:1b}",\
                "minecraft:consumable":{\
                    consume_seconds:0.5f,\
                    animation:"bow",\
                    has_consume_particles:0b,sound:"block.wool.step",\
                    on_consume_effects:[{type:"play_sound",sound:"block.wool.step"}]},\
                "minecraft:item_name":\
                    {text:"Throwing Knife"},\
                "minecraft:max_stack_size":4}}}

# 2. Spawn a lag-free marker exactly 1 block in the direction the player is looking
execute at @s anchored eyes \
    run summon marker ^ ^ ^1 {Tags:["aim_assist"]}

# 3. Calculate the directional vector (Marker Pos - Arrow Pos)
execute store result score #X1 im_temp run data get entity @n[type=arrow,tag=knife_proj] Pos[0] 1000
execute store result score #Y1 im_temp run data get entity @n[type=arrow,tag=knife_proj] Pos[1] 1000
execute store result score #Z1 im_temp run data get entity @n[type=arrow,tag=knife_proj] Pos[2] 1000

execute store result score #X2 im_temp run data get entity @n[type=marker,tag=aim_assist] Pos[0] 1000
execute store result score #Y2 im_temp run data get entity @n[type=marker,tag=aim_assist] Pos[1] 1000
execute store result score #Z2 im_temp run data get entity @n[type=marker,tag=aim_assist] Pos[2] 1000

scoreboard players operation #X2 im_temp -= #X1 im_temp
scoreboard players operation #Y2 im_temp -= #Y1 im_temp
scoreboard players operation #Z2 im_temp -= #Z1 im_temp

# 4. Inject the calculated vector into the Arrow's Motion
execute store result entity @n[type=arrow,tag=knife_proj] Motion[0] double 0.001 run scoreboard players get #X2 im_temp
execute store result entity @n[type=arrow,tag=knife_proj] Motion[1] double 0.001 run scoreboard players get #Y2 im_temp
execute store result entity @n[type=arrow,tag=knife_proj] Motion[2] double 0.001 run scoreboard players get #Z2 im_temp

# 5. Set Speed Multiplier and execute your existing scaling math
scoreboard players set #SPEED im_temp 2
execute as @n[type=arrow,tag=knife_proj] run function imperium:items/throwing_knife/speed

# 6. Cleanup
kill @n[type=marker,tag=aim_assist]
tag @n[type=arrow,tag=knife_proj] remove knife_proj