item replace entity @e[type=#imperium:human,scores={givekit=14}] armor.head with golden_helmet[unbreakable={},attribute_modifiers=[{id:"armor",type:"armor",amount:2,operation:"add_value",slot:"head"}]] 1
item replace entity @e[type=#imperium:human,scores={givekit=14}] armor.chest with leather_chestplate[unbreakable={},attribute_modifiers=[{id:"armor",type:"armor",amount:5,operation:"add_value",slot:"chest"}]] 1
item replace entity @e[type=#imperium:human,scores={givekit=14}] armor.legs with iron_leggings[unbreakable={},attribute_modifiers=[{id:"armor",type:"armor",amount:5,operation:"add_value",slot:"legs"}]] 1
item replace entity @e[type=#imperium:human,scores={givekit=14}] armor.feet with iron_boots[unbreakable={},attribute_modifiers=[{id:"armor",type:"armor",amount:2,operation:"add_value",slot:"feet"}]] 1

item replace entity @e[type=#imperium:human,scores={givekit=14}] hotbar.0 with diamond_pickaxe[unbreakable={},enchantments={"sharpness":3}] 1

give @s \
    mushroom_stew[\
        food={nutrition:0,saturation:0,can_always_eat:true},\
        consumable={\
            consume_seconds:0,\
            on_consume_effects:[{type:"apply_effects",effects:[\
                {id:"instant_health",amplifier:1,duration:1}]}]},\
        use_remainder={"id":"bowl",count:1}\
    ] 10

scoreboard players set @e[type=#imperium:human,scores={givekit=14}] rMushSoup 1
