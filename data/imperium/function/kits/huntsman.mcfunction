item replace entity @s armor.head with leather_helmet[unbreakable={},enchantments={"protection":1},attribute_modifiers=[{id:"armor",type:"armor",amount:2,operation:"add_value",slot:"head"}],dyed_color=10329495] 1
item replace entity @s armor.chest with leather_chestplate[unbreakable={},enchantments={"protection":2},attribute_modifiers=[{id:"armor",type:"armor",amount:6,operation:"add_value",slot:"chest"}],dyed_color=6192150] 1
item replace entity @s armor.legs with leather_leggings[unbreakable={},enchantments={"protection":1},attribute_modifiers=[{id:"armor",type:"armor",amount:4,operation:"add_value",slot:"legs"}]] 1
item replace entity @s armor.feet with leather_boots[unbreakable={},enchantments={"protection":1},attribute_modifiers=[{id:"armor",type:"armor",amount:2,operation:"add_value",slot:"feet"}],dyed_color=8606770] 1

item replace entity @s hotbar.0 with iron_axe[unbreakable={},attribute_modifiers=[{id:"attack_damage",type:"attack_damage",amount:6,operation:"add_value",slot:"mainhand"},{id:"attack_speed",type:"attack_speed",amount:-3,operation:"add_value",slot:"mainhand"}]] 1
item replace entity @s weapon.offhand with bow[unbreakable={}] 1
item replace entity @s hotbar.1 with wolf_spawn_egg[can_place_on=[{blocks:"#mineable/axe"},{blocks:"#mineable/hoe"},{blocks:"#mineable/pickaxe"},{blocks:"#mineable/shovel"}],entity_data={id:"wolf",body_armor_item:{id:"wolf_armor",count:1,components:{"unbreakable":{}}}}] 1
item replace entity @s hotbar.7 with bone 64
item replace entity @s hotbar.8 with tipped_arrow[potion_contents={potion:"poison"}] 3

# Splash Health 2 Potions
give @s splash_potion[potion_contents={potion:"strong_healing"}] 12

scoreboard players set @s rHeal2Pot 1
scoreboard players set @s rPoisonArrow 3
scoreboard players set @s rWolfEgg 1

