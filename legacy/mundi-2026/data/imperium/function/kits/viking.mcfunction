item replace entity @s armor.head with \
    iron_helmet[\
        unbreakable={},\
            attribute_modifiers=[\
                {id:"armor",type:"armor",amount:2,operation:"add_value",slot:"head"}\
    ]] 1
item replace entity @s armor.chest with \
    chainmail_chestplate[\
        unbreakable={},\
            attribute_modifiers=[\
                {id:"armor",type:"armor",amount:5,operation:"add_value",slot:"chest"}\
    ]] 1
item replace entity @s armor.legs with \
    leather_leggings[\
        unbreakable={},\
            attribute_modifiers=[\
                {id:"armor",type:"armor",amount:5,operation:"add_value",slot:"legs"}\
    ]] 1
item replace entity @s armor.feet with \
    leather_boots[\
        unbreakable={},\
            attribute_modifiers=[\
                {id:"armor",type:"armor",amount:2,operation:"add_value",slot:"feet"}\
    ]] 1

item replace entity @s hotbar.0 with iron_axe[unbreakable={}] 1

# Mushroom Soup
give @s mushroom_stew[food={nutrition:0,saturation:0,can_always_eat:true},consumable={consume_seconds:0,on_consume_effects:[{type:"apply_effects",effects:[{id:"instant_health",amplifier:1,duration:1}]}]},use_remainder={id:"bowl",count:1}] 10

scoreboard players set @s rMushSoup 1

