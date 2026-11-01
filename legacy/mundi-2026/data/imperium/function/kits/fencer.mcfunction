item replace entity @s armor.head with leather_helmet[unbreakable={},attribute_modifiers=[{id:"armor",type:"armor",amount:2,operation:"add_value",slot:"head"}],dyed_color=3949738] 1
item replace entity @s armor.chest with chainmail_chestplate[unbreakable={},attribute_modifiers=[{id:"armor",type:"armor",amount:5,operation:"add_value",slot:"chest"}]] 1
item replace entity @s armor.legs with chainmail_leggings[unbreakable={},attribute_modifiers=[{id:"armor",type:"armor",amount:5,operation:"add_value",slot:"legs"}]] 1
item replace entity @s armor.feet with leather_boots[unbreakable={},attribute_modifiers=[{id:"armor",type:"armor",amount:2,operation:"add_value",slot:"head"}],dyed_color=3949738] 1

item replace entity @s hotbar.0 with iron_sword[unbreakable={},attribute_modifiers=[{id:"attack_damage",type:"attack_damage",amount:2,operation:"add_value",slot:"mainhand"},{id:"attack_speed",type:"attack_speed",amount:2,operation:"add_value",slot:"mainhand"}]] 1

# Beetroot Soup
give @s beetroot_soup[food={nutrition:0,saturation:0,can_always_eat:true},consumable={consume_seconds:0,on_consume_effects:[{type:"apply_effects",effects:[{id:"instant_health",amplifier:0,duration:1}]}]},use_remainder={"id":"bowl",count:1}] 20

scoreboard players set @s rBeetSoup 1

