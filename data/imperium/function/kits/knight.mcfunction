item replace entity @s armor.head with chainmail_helmet[unbreakable={},attribute_modifiers=[{id:"armor",type:"armor",amount:0,operation:"add_value",slot:"head"}]] 1
item replace entity @s armor.chest with iron_chestplate[unbreakable={},attribute_modifiers=[{id:"armor",type:"armor",amount:6,operation:"add_value",slot:"chest"}]] 1
item replace entity @s armor.legs with chainmail_leggings[unbreakable={},attribute_modifiers=[{id:"armor",type:"armor",amount:4,operation:"add_value",slot:"legs"}]] 1
item replace entity @s armor.feet with chainmail_boots[unbreakable={},attribute_modifiers=[{id:"armor",type:"armor",amount:2,operation:"add_value",slot:"feet"}]] 1

item replace entity @s hotbar.0 with diamond_sword[unbreakable={}] 1
item replace entity @s weapon.offhand with camel_spawn_egg[can_place_on=[{blocks:"#mineable/axe"},{blocks:"#mineable/hoe"},{blocks:"#mineable/pickaxe"},{blocks:"#mineable/shovel"}],entity_data={id:"minecraft:camel",Tame:1b,equipment:{saddle:{id:"minecraft:saddle",count:1,components:{"minecraft:attribute_modifiers":[{id:"armor",type:"armor",amount:10,operation:"add_value",slot:"any"}]}}}}] 1

# Splash Health 2 Potions
give @s splash_potion[potion_contents={potion:"strong_healing"}] 12

scoreboard players set @s rHeal2Pot 1
scoreboard players set @s rCamelEgg 1
