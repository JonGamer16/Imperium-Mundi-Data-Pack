item replace entity @s armor.head with \
    leather_helmet[\
        unbreakable={},\
        attribute_modifiers=[\
            {id:"armor",type:"armor",amount:2,operation:"add_value",slot:"head"}],\
        dyed_color=6192150] 1
item replace entity @s armor.chest with \
    leather_chestplate[\
        unbreakable={}\
    ] 1
item replace entity @s armor.legs with \
    chainmail_leggings[\
        unbreakable={}\
    ] 1
item replace entity @s armor.feet with \
    leather_boots[\
        unbreakable={}\
    ] 1

item replace entity @s hotbar.0 with \
    iron_sword[\
        unbreakable={}\
    ] 1
item replace entity @s hotbar.1 with \
    golden_axe[\
        unbreakable={}\
    ] 1
item replace entity @s weapon.offhand with \
    bow[\
        unbreakable={}\
    ]
item replace entity @s hotbar.8 with \
    arrow 2

# Mushroom Soup
give @s mushroom_stew[food={nutrition:0,saturation:0,can_always_eat:true},consumable={consume_seconds:0,on_consume_effects:[{type:"apply_effects",effects:[{id:"instant_health",amplifier:1,duration:1}]}]},use_remainder={id:"bowl",count:1}] 10

scoreboard players set @s rMushSoup 1
scoreboard players set @s rArrow 2
