item replace entity @s armor.head with \
    leather_helmet[unbreakable={},\
        attribute_modifiers=[\
            {type:"armor",amount:2,operation:"add_value",slot:"head",id:"head"}\
        ],\
        dyed_color=16753920] 1
item replace entity @s armor.chest with \
    chainmail_chestplate[unbreakable={},\
        attribute_modifiers=[\
            {type:"armor",amount:5,operation:"add_value",slot:"chest",id:"chest"}\
        ]\
    ] 1
item replace entity @s armor.legs with \
    chainmail_leggings[unbreakable={},\
        attribute_modifiers=[\
            {type:"armor",amount:4,operation:"add_value",slot:"legs",id:"legs"}\
        ]\
    ] 1
item replace entity @s armor.feet with \
    leather_boots[unbreakable={},\
        attribute_modifiers=[\
            {type:"armor",amount:1,operation:"add_value",slot:"feet",id:"feet"},\
            {type:"movement_speed",amount:0.2,operation:"add_multiplied_base",slot:"feet",id:"feet"}\
        ],\
        dyed_color=4673362\
    ] 1
# colors: 16753920 helmet, 4673362 boots

item replace entity @s hotbar.0 with \
    iron_sword[\
        unbreakable={}\
    ] 1

item replace entity @s weapon.offhand with \
    crossbow[\
        unbreakable={},\
        enchantments={\
            "quick_charge":3,"multishot":1\
        }\
    ] 1

item replace entity @s hotbar.1 with \
    crossbow[\
        unbreakable={},\
        enchantments={\
            "multishot":1\
        }\
    ] 1

item replace entity @s hotbar.8 with \
    arrow 4

# Mushroom Soup
give @s mushroom_stew[food={nutrition:0,saturation:0,can_always_eat:true},consumable={consume_seconds:0,on_consume_effects:[{type:"apply_effects",effects:[{id:"instant_health",amplifier:1,duration:1}]}]},use_remainder={id:"bowl",count:1}] 10

scoreboard players set @s rArrow 4
scoreboard players set @s rMushSoup 1
