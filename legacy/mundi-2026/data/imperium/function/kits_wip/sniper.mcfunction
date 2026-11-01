item replace entity @e[type=#imperium:human,scores={givekit=23}] armor.head with leather_helmet[unbreakable={},attribute_modifiers=[{id:"armor",type:"armor",amount:2,operation:"add_value",slot:"head"}],dyed_color=4148763] 1
item replace entity @e[type=#imperium:human,scores={givekit=23}] armor.chest with leather_chestplate[unbreakable={},attribute_modifiers=[{id:"armor",type:"armor",amount:5,operation:"add_value",slot:"chest"}],dyed_color=8606770] 1
item replace entity @e[type=#imperium:human,scores={givekit=23}] armor.legs with leather_leggings[unbreakable={},attribute_modifiers=[{id:"armor",type:"armor",amount:4,operation:"add_value",slot:"legs"}],dyed_color=8606770] 1
item replace entity @e[type=#imperium:human,scores={givekit=23}] armor.feet with leather_boots[unbreakable={},attribute_modifiers=[{id:"armor",type:"armor",amount:1,operation:"add_value",slot:"feet"}],dyed_color=4148763] 1

item replace entity @e[type=#imperium:human,scores={givekit=23}] hotbar.0 with iron_sword[unbreakable={}] 1
item replace entity @e[type=#imperium:human,scores={givekit=23}] weapon.offhand with bow[unbreakable={}] 1
item replace entity @e[type=#imperium:human,scores={givekit=23}] hotbar.8 with arrow 3

give @s \
    mushroom_stew[\
        food={nutrition:0,saturation:0,can_always_eat:true},\
        consumable={\
            consume_seconds:0,\
            on_consume_effects:[{type:"apply_effects",effects:[\
                {id:"instant_health",amplifier:1,duration:1}]}]},\
        use_remainder={"id":"bowl",count:1}\
    ] 10

scoreboard players set @e[type=#imperium:human,scores={givekit=23}] rMushSoup 1
scoreboard players set @e[type=#imperium:human,scores={givekit=23}] rArrow 3
scoreboard players set @e[type=#imperium:human,scores={givekit=23}] givekit 0
