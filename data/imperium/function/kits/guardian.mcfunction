item replace entity @s armor.head with diamond_helmet[unbreakable={},attribute_modifiers=[{id:"armor",type:"armor",amount:3,operation:"add_value",slot:"head"}]] 1
item replace entity @s armor.chest with leather_chestplate[unbreakable={},attribute_modifiers=[{id:"armor",type:"armor",amount:5,operation:"add_value",slot:"chest"}],dyed_color=6990551] 1
# color: 6990551
item replace entity @s armor.legs with leather_leggings[unbreakable={},attribute_modifiers=[{id:"armor",type:"armor",amount:4,operation:"add_value",slot:"legs"}],dyed_color=10329495] 1
# color: 10329495
item replace entity @s armor.feet with iron_boots[unbreakable={},enchantments={"binding_curse":1},attribute_modifiers=[{id:"armor",type:"armor",amount:3,operation:"add_value",slot:"feet"},{id:"movement_speed",type:"movement_speed",amount:-0.6,operation:"add_multiplied_base",slot:"feet"}]] 1

item replace entity @s hotbar.0 with trident[unbreakable={}] 1
item replace entity @s weapon.offhand with trident[unbreakable={},enchantments={"sharpness":1},damage=245] 1

# Splash Health 2 Potions
give @s potion[potion_contents={potion:"strong_healing"}] 12

scoreboard players set @s rTrident 1
scoreboard players set @s rTrident2 1
scoreboard players set @s rHeal2Pot 1

