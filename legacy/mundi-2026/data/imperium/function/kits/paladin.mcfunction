item replace entity @s armor.head with iron_helmet[unbreakable={},enchantments={"protection":1},attribute_modifiers=[{id:"armor",type:"armor",amount:2,operation:"add_value",slot:"head"}]] 1
item replace entity @s armor.chest with iron_chestplate[unbreakable={},enchantments={"protection":1},attribute_modifiers=[{id:"armor",type:"armor",amount:6,operation:"add_value",slot:"chest"}]] 1
item replace entity @s armor.legs with iron_leggings[unbreakable={},enchantments={"protection":1},attribute_modifiers=[{id:"armor",type:"armor",amount:5,operation:"add_value",slot:"legs"}]] 1
item replace entity @s armor.feet with iron_boots[unbreakable={},enchantments={"protection":1,"binding_curse":1},attribute_modifiers=[{id:"armor",type:"armor",amount:2,operation:"add_value",slot:"feet"},{id:"movement_speed",type:"movement_speed",amount:-0.3,operation:"add_multiplied_base",slot:"feet"}]] 1

item replace entity @s hotbar.0 with iron_sword[unbreakable={},enchantments={"knockback":1}] 1

# Special Healing Potions
give @s \
    splash_potion[\
        potion_contents={\
            custom_color:16711901,\
            custom_effects:[\
                {   id:"regeneration",\
                    amplifier:4,\
                    duration:48,\
                    show_particles:1b,\
                    show_icon:1b\
                }\
            ]\
        }\
    ] 8

scoreboard players set @s rRegenPot 1
