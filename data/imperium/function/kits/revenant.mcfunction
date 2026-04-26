item replace entity @s armor.head with \
    leather_helmet[\
        unbreakable={},\
        enchantments=\
            {"protection":2},\
        dyed_color=16701501\
    ] 1
item replace entity @s armor.chest with \
    chainmail_chestplate[\
        unbreakable={},\
        enchantments=\
            {"protection":2}\
    ] 1
item replace entity @s armor.legs with \
    leather_leggings[unbreakable={},\
        enchantments=\
            {"protection":2},\
        dyed_color=16701501\
    ] 1
item replace entity @s armor.feet with \
    leather_boots[unbreakable={},\
        enchantments=\
            {"protection":2}\
    ] 1

item replace entity @s hotbar.0 with \
    golden_sword[\
        unbreakable={},\
        enchantments=\
            {"sharpness":3}\
    ] 1
item replace entity @s weapon.offhand with \
    totem_of_undying 1

give @s \
    golden_apple[\
        max_stack_size=1,\
        food={nutrition:0,saturation:0,can_always_eat:true},\
        consumable={\
            consume_seconds:0.8,\
            on_consume_effects:[\
                {\
                    type:"apply_effects",\
                    effects:[\
                        {id:"instant_health",amplifier:0,duration:1},\
                        {id:"regeneration",amplifier:1,duration:121},\
                        {id:"absorption",amplifier:1,duration:600}\
                    ]\
                }\
            ]\
        }\
    ] 8

scoreboard players set @s rGapple 1
scoreboard players set @s rTotem 1
