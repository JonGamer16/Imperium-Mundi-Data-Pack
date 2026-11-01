item replace entity @s armor.head with \
    netherite_helmet[unbreakable={},\
        attribute_modifiers=[\
            {type:"armor",amount:2,operation:"add_value",slot:"head",id:"head"}\
        ]\
    ] 1
item replace entity @s armor.chest with \
    iron_chestplate[unbreakable={},\
        attribute_modifiers=[\
            {type:"armor",amount:6,operation:"add_value",slot:"chest",id:"chest"}\
        ]\
    ] 1
item replace entity @s armor.legs with \
    netherite_leggings[unbreakable={},\
        attribute_modifiers=[\
            {type:"armor",amount:5,operation:"add_value",slot:"legs",id:"legs"}\
        ]\
    ] 1
item replace entity @s armor.feet with \
    iron_boots[unbreakable={},\
        attribute_modifiers=[\
            {type:"armor",amount:2,operation:"add_value",slot:"feet",id:"feet"}\
        ]\
    ] 1

item replace entity @s hotbar.0 with \
    diamond_sword[\
        unbreakable={}\
    ] 1

# Splash Health 2 Potions
give @s splash_potion[potion_contents={potion:"strong_healing"}] 12

scoreboard players set @s rHeal2Pot 1

summon block_display ~ ~ ~ {block_state:{Name:"fire"},brightness:{block:15,sky:15},HasVisualFire:1b}