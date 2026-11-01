item replace entity @s armor.head with \
    leather_helmet[\
        unbreakable={},\
        enchantments={\
            "protection":1\
        }\
    ] 1
item replace entity @s armor.chest with \
    leather_chestplate[\
        unbreakable={},\
        enchantments={\
            "protection":1\
        }\
    ] 1
item replace entity @s armor.legs with \
    leather_leggings[\
        unbreakable={},\
        enchantments={\
            "protection":1\
        }\
    ] 1
item replace entity @s armor.feet with \
    leather_boots[\
        unbreakable={},\
        enchantments={\
            "protection":1\
        }\
    ] 1

item replace entity @s hotbar.0 with \
    iron_sword[\
        unbreakable={},\
        enchantments={\
            "sharpness":1\
        }\
    ] 1
item replace entity @s hotbar.1 with ender_pearl 4

# Splash Health 2 Potions
give @s splash_potion[potion_contents={potion:"strong_healing"}] 12

scoreboard players set @s rHeal2Pot 1
scoreboard players set @s rPearl 4
