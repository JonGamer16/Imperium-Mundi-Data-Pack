item replace entity @s armor.head with leather_helmet[unbreakable={},attribute_modifiers=[{id:"armor",type:"armor",amount:1,operation:"add_value",slot:"head"}],dyed_color=16711680] 1
item replace entity @s armor.chest with iron_chestplate[unbreakable={},attribute_modifiers=[{id:"armor",type:"armor",amount:6,operation:"add_value",slot:"chest"}]] 1
item replace entity @s armor.legs with leather_leggings[unbreakable={},attribute_modifiers=[{id:"armor",type:"armor",amount:2,operation:"add_value",slot:"legs"}],dyed_color=16711680] 1
item replace entity @s armor.feet with leather_boots[unbreakable={},attribute_modifiers=[{id:"armor",type:"armor",amount:1,operation:"add_value",slot:"feet"}],dyed_color=16711680] 1

item replace entity @s hotbar.0 with iron_sword[unbreakable={},enchantments={"sharpness":1}] 1
item replace entity @s weapon.offhand with bow[unbreakable={}] 1
item replace entity @s hotbar.8 with arrow 3

give @s \
    rabbit_stew[\
        food={nutrition:0,saturation:0,can_always_eat:true},\
        consumable={\
            consume_seconds:0,\
            on_consume_effects:[{type:"apply_effects",effects:[\
                {id:"instant_health",amplifier:1,duration:1},\
                {id:"instant_health",amplifier:0,duration:1}]}]},\
        use_remainder={"id":"bowl",count:1}\
    ] 7

scoreboard players set @s rRabbitSoup 1
scoreboard players set @s rArrow 3
scoreboard players set @s givekit 0
