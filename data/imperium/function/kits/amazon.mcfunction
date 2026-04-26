item replace entity @s armor.head with \
    leather_helmet[\
        unbreakable={},\
        attribute_modifiers=[\
            {id:"armor",type:"armor",amount:2,operation:"add_value",slot:"head"}\
        ],\
        dyed_color=16384\
    ] 1
item replace entity @s armor.chest with \
    leather_chestplate[\
        unbreakable={},\
        attribute_modifiers=[\
            {id:"armor",type:"armor",amount:5,operation:"add_value",slot:"chest"}\
        ],\
        dyed_color=16384\
    ] 1
item replace entity @s armor.legs with \
    leather_leggings[\
        unbreakable={},\
        attribute_modifiers=[\
            {id:"armor",type:"armor",amount:4,operation:"add_value",slot:"legs"},\
            {id:"sneaking_speed",type:"sneaking_speed",amount:0.7,operation:"add_value"}\
        ],\
        dyed_color=16384\
    ] 1
item replace entity @s armor.feet with \
    leather_boots[\
        unbreakable={},\
        attribute_modifiers=[\
            {id:"armor",type:"armor",amount:1,operation:"add_value",slot:"feet"},\
            {id:"movement_speed",type:"movement_speed",amount:0.5,operation:"add_multiplied_base"}\
        ],\
        dyed_color=16384\
    ] 1

item replace entity @s hotbar.0 with iron_sword[unbreakable={}] 1

# Beetroot Soup
give @s beetroot_soup[food={nutrition:0,saturation:0,can_always_eat:true},consumable={consume_seconds:0,on_consume_effects:[{type:"apply_effects",effects:[{id:"instant_health",amplifier:0,duration:1}]}]},use_remainder={"id":"bowl",count:1}] 20

scoreboard players set @s rBeetSoup 1

