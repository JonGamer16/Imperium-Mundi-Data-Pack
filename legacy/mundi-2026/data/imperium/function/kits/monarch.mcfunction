item replace entity @s armor.head with golden_helmet[unbreakable={},attribute_modifiers=[{id:"armor",type:"armor",amount:2,operation:"add_value",slot:"head"}]] 1
item replace entity @s armor.chest with golden_chestplate[unbreakable={},attribute_modifiers=[{id:"armor",type:"armor",amount:5,operation:"add_value",slot:"chest"}]] 1
item replace entity @s armor.legs with golden_leggings[unbreakable={},attribute_modifiers=[{id:"armor",type:"armor",amount:3,operation:"add_value",slot:"legs"}]] 1
item replace entity @s armor.feet with golden_boots[unbreakable={},attribute_modifiers=[{id:"armor",type:"armor",amount:1,operation:"add_value",slot:"feet"}]] 1

item replace entity @s hotbar.0 with golden_axe[unbreakable={}] 1
item replace entity @s hotbar.1 with golden_sword[enchantments={"sharpness":3,"sweeping_edge":3},damage=16] 1
item replace entity @s weapon.offhand with golden_helmet[enchantments={"protection":3},damage=62] 1
item replace entity @s hotbar.6 with golden_chestplate[enchantments={"protection":3},damage=52] 1
item replace entity @s hotbar.7 with golden_leggings[enchantments={"protection":3},damage=60] 1
item replace entity @s hotbar.8 with golden_boots[enchantments={"protection":3},damage=61] 1

# Rabbit Stew
give @s rabbit_stew[food={nutrition:0,saturation:0,can_always_eat:true},consumable={consume_seconds:0,on_consume_effects:[{type:"apply_effects",effects:[{id:"instant_health",amplifier:1,duration:1},{id:"instant_health",amplifier:0,duration:1}]}]},use_remainder={"id":"bowl",count:1}] 7

scoreboard players set @s rRabbitSoup 1
scoreboard players set @s rGoldArmor 1

