item replace entity @s armor.head with leather_helmet[unbreakable={},enchantments={"protection":2},attribute_modifiers=[{id:"armor",type:"armor",amount:2,operation:"add_value",slot:"head"}],dyed_color=8439583] 1
item replace entity @s armor.chest with leather_chestplate[unbreakable={},enchantments={"protection":2},attribute_modifiers=[{id:"armor",type:"armor",amount:5,operation:"add_value",slot:"chest"}],dyed_color=6192150] 1
item replace entity @s armor.legs with leather_leggings[unbreakable={},enchantments={"protection":2},attribute_modifiers=[{id:"armor",type:"armor",amount:4,operation:"add_value",slot:"legs"}],dyed_color=8606770] 1
item replace entity @s armor.feet with leather_boots[unbreakable={},enchantments={"protection":2},attribute_modifiers=[{id:"armor",type:"armor",amount:1,operation:"add_value",slot:"feet"}],dyed_color=8606770] 1

item replace entity @s hotbar.0 with wooden_shovel[unbreakable={},attribute_modifiers=[{id:"attack_damage",type:"attack_damage",amount:3,operation:"add_value",slot:"mainhand"},{id:"attack_speed",type:"attack_speed",amount:2,operation:"add_value",slot:"feet"}]] 1
item replace entity @s hotbar.1 with mace[unbreakable={},attribute_modifiers=[{id:"attack_damage",type:"attack_damage",amount:1,operation:"add_value",slot:"mainhand"},{id:"attack_speed",type:"attack_speed",amount:-3.5,operation:"add_value",slot:"mainhand"}]]

give @s splash_potion[potion_contents={custom_color:5897984,custom_effects:[{id:"jump_boost",amplifier:1,duration:200,show_icon:1b}]}] 3
# Beetroot Soup
give @s \
    beetroot_soup[\
        food={nutrition:0,saturation:0,can_always_eat:true},\
        consumable={\
            consume_seconds:0,\
            on_consume_effects:[{type:"apply_effects",effects:[\
                {id:"instant_health",amplifier:0,duration:1}]}]},\
        use_remainder={"id":"bowl",count:1}\
    ] 20

scoreboard players set @s rBeetSoup 1
scoreboard players set @s rJumpPot 3
