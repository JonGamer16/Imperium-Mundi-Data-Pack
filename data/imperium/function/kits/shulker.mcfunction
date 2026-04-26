item replace entity @s armor.head with \
    golden_helmet[\
        unbreakable={},\
        enchantments={"protection":2},\
        attribute_modifiers=[\
            {id:"armor",type:"armor",amount:2,operation:"add_value",slot:"head"}\
    ]] 1
item replace entity @s armor.chest with \
    leather_chestplate[\
        unbreakable={},\
        enchantments={"protection":2},\
        attribute_modifiers=[\
            {id:"armor",type:"armor",amount:3,operation:"add_value",slot:"chest"}],\
        dyed_color=8991416] 1
item replace entity @s armor.legs with \
    leather_leggings[\
        unbreakable={},\
        enchantments={"protection":2},\
        attribute_modifiers=[\
            {id:"armor",type:"armor",amount:2,operation:"add_value",slot:"legs"}],\
        dyed_color=8991416] 1
item replace entity @s armor.feet with \
    leather_boots[\
        unbreakable={},\
        enchantments={"protection":2},\
        attribute_modifiers=[\
            {id:"armor",type:"armor",amount:1,operation:"add_value",slot:"feet"}],\
        dyed_color=8991416] 1

item replace entity @s hotbar.0 with \
    end_rod[\
        attribute_modifiers=[\
            {id:"attack_damage",type:"attack_damage",amount:4,operation:"add_value",slot:"mainhand"},\
            {id:"attack_speed",type:"attack_speed",amount:2,operation:"add_value",slot:"mainhand"}\
    ]] 1
item replace entity @s weapon.offhand with \
    bow[unbreakable={}] 1
item replace entity @s hotbar.8 with \
    tipped_arrow[\
        potion_contents={\
            custom_color:6684927,\
            custom_effects:[\
                {id:"levitation",amplifier:0,duration:100}\
    ]}] 3

# Health 2 Potions
give @s splash_potion[potion_contents={potion:"strong_healing"}] 12

scoreboard players set @s rHeal2Pot 1
scoreboard players set @s rGravityArrow 3
