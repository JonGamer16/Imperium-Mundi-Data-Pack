item replace entity @s armor.head with \
    leather_helmet[\
        unbreakable={},\
        dyed_color=6825251\
    ] 1
item replace entity @s armor.chest with \
    leather_chestplate[\
        unbreakable={},\
        dyed_color=11546150\
    ] 1
item replace entity @s armor.legs with \
    golden_leggings[\
        unbreakable={},\
        enchantments={\
            "fire_protection":2,\
            "protection":2\
    }] 1
item replace entity @s armor.feet with \
    golden_boots[\
        unbreakable={},\
        enchantments={\
            "fire_protection":2,\
            "protection":2\
    }] 1

item replace entity @s hotbar.0 with \
    golden_sword[\
        unbreakable={},\
        enchantments={\
            "sharpness":1,\
            "fire_aspect":1\
    }] 1
item replace entity @s weapon.offhand with \
    blaze_spawn_egg[\
        can_place_on=[\
            {blocks:"#mineable/axe"},\
            {blocks:"#mineable/pickaxe"},\
            {blocks:"#mineable/shovel"},\
            {blocks:"#mineable/hoe"}\
        ],\
        entity_data={\
            id:"blaze",\
            attributes:[\
                {id:"armor",base:10},\
                {id:"attack_damage",base:7},\
                {id:"movement_speed",base:0.46}\
            ]\
        }\
    ] 1

# Health 2 Potions
give @s splash_potion[potion_contents={potion:"strong_healing"}] 12

scoreboard players set @s rBlazeEgg 1
team join blaze @s
scoreboard players set @s rHeal2Pot 1
