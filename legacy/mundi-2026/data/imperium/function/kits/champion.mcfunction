item replace entity @s armor.head with \
    diamond_helmet[\
        unbreakable={},\
        attribute_modifiers=[\
            {id:"armor",type:"armor",amount:3,operation:"add_value",slot:"head"}\
        ]\
    ] 1
item replace entity @s armor.chest with \
    diamond_chestplate[\
        unbreakable={},\
        attribute_modifiers=[\
            {id:"armor",type:"armor",amount:8,operation:"add_value",slot:"chest"}\
        ]\
    ] 1
item replace entity @s armor.legs with \
    diamond_leggings[\
        unbreakable={},\
        attribute_modifiers=[\
            {id:"armor",type:"armor",amount:6,operation:"add_value",slot:"legs"}\
        ]\
    ] 1
item replace entity @s armor.feet with \
    diamond_boots[\
        unbreakable={},\
        enchantments={\
            "binding_curse":1\
        },\
        attribute_modifiers=[\
            {id:"armor",type:"armor",amount:3,operation:"add_value",slot:"feet"},\
            {id:"movement_speed",type:"movement_speed",amount:-0.6,operation:"add_multiplied_base",slot:"feet"}\
        ]\
    ] 1

item replace entity @s hotbar.0 with \
    stone_sword[\
        unbreakable={},\
        enchantments={\
            "knockback":1,\
            "sharpness":1,\
            "sweeping_edge":3\
        }\
    ] 1

# Mushroom Stew
give @s mushroom_stew[food={nutrition:0,saturation:0,can_always_eat:true},consumable={consume_seconds:0,on_consume_effects:[{type:"apply_effects",effects:[{id:"instant_health",amplifier:1,duration:1}]}]},use_remainder={"id":"bowl",count:1}] 7

scoreboard players set @s rRabbitSoup 1

