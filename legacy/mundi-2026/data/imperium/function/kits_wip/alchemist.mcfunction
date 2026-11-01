item replace entity @s armor.head with \
    leather_helmet[\
        unbreakable={},\
        enchantments={\
            "protection":2},\
        dyed_color=6437809] 1
item replace entity @s armor.chest with \
    leather_chestplate[\
        unbreakable={},\
        enchantments={\
            "protection":2},\
        dyed_color=6437809] 1
item replace entity @s armor.legs with \
    leather_leggings[unbreakable={},\
        enchantments={\
            "protection":2},\
        dyed_color=6437809] 1
item replace entity @s armor.feet with \
    leather_boots[unbreakable={},\
        enchantments={\
            "protection":2\
        },\
        dyed_color=6437809\
    ] 1
# colors: 4673362

item replace entity @s hotbar.0 with \
    stone_sword[\
        unbreakable={},\
        enchantments={\
            "sharpness":1\
        }\
    ] 1
            
item replace entity @s hotbar.1 with \
    lingering_potion[\
        potion_contents={\
            custom_color:7820731,\
            custom_effects:[\
                {id:"slowness",amplifier:1,duration:100,show_icon:1b},\
                {id:"mining_fatigue",amplifier:2,duration:40,show_icon:1b}]\
    }] 2

# Splash Healing 2 Potions
give @s splash_potion[potion_contents={potion:"strong_healing"}] 12

scoreboard players set @s rHeal2Pot 1
scoreboard players set @s rSlowPot 2
