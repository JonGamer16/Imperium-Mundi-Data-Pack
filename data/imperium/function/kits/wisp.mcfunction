item replace entity @s armor.head with \
    golden_helmet[\ 
        unbreakable={},\
        enchantments=\
            {"protection":2},\
        attribute_modifiers=[\
            {id:"armor",type:"armor",amount:2,operation:"add_value",slot:"head"}\
    ]] 1
item replace entity @s armor.chest with \
    leather_chestplate[\
        unbreakable={},\
        enchantments={"protection":2},\
        attribute_modifiers=[{id:"armor",type:"armor",amount:3,operation:"add_value",slot:"chest"}],\
        dyed_color=16701501\
    ] 1
item replace entity @s armor.legs with \
    iron_leggings[\
        unbreakable={},\
        enchantments={"protection":2},\
        attribute_modifiers=[{id:"armor",type:"armor",amount:5,operation:"add_value",slot:"legs"}\
    ]] 1
item replace entity @s armor.feet with \
    leather_boots[\
        unbreakable={},\
        enchantments={"protection":2},\
        attribute_modifiers=[{id:"armor",type:"armor",amount:2,operation:"add_value",slot:"feet"},\
            {id:"movement_speed",type:"movement_speed",amount:0.2,operation:"add_multiplied_base"}],\
        dyed_color=16383998] 1

item replace entity @s hotbar.0 with \
    blaze_rod[\
        attribute_modifiers=[\
            {id:"attack_damage",type:"attack_damage",amount:3,operation:"add_value",slot:"mainhand"},\
            {id:"attack_speed",type:"attack_speed",amount:2,operation:"add_value",slot:"mainhand"}]] 1
item replace entity @s weapon.offhand with bow[unbreakable={},enchantments={"flame":1}] 1
item replace entity @s hotbar.8 with arrow 6 

# Mushroom Soup
give @s mushroom_stew[food={nutrition:0,saturation:0,can_always_eat:true},consumable={consume_seconds:0,on_consume_effects:[{type:"apply_effects",effects:[{id:"instant_health",amplifier:1,duration:1}]}]},use_remainder={id:"bowl",count:1}] 10

scoreboard players set @s rMushSoup 1
scoreboard players set @s rArrow 6
