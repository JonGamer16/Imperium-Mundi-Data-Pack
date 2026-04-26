clear @s wolf_spawn_egg
clear @s bone
give @s wolf_spawn_egg[can_place_on=[{blocks:"#mineable/axe"},{blocks:"#mineable/pickaxe"},{blocks:"#mineable/shovel"},{blocks:"#mineable/hoe"}],entity_data={id:"wolf",body_armor_item:{id:"wolf_armor",count:1,components:{"unbreakable":{}}}}] 1
give @s bone 64

scoreboard players remove @s itemreload 600