item replace entity @s armor.head with \
    zombie_head[\
        attribute_modifiers=[\
            {type:"armor",amount:2,operation:"add_value",slot:"head",id:"head"}]] 1
item replace entity @s armor.chest with \
    iron_chestplate[\
        unbreakable={},\
        attribute_modifiers=[\
            {type:"armor",amount:7,operation:"add_value",slot:"head",id:"head"}]] 1
item replace entity @s armor.legs with \
    iron_leggings[\
        unbreakable={},\
        attribute_modifiers=[\
            {type:"armor",amount:6,operation:"add_value",slot:"head",id:"head"}]] 1
item replace entity @s armor.feet with \
    iron_boots[\
        unbreakable={},\
        enchantments={\
            "binding_curse":1},\
        attribute_modifiers=[\
            {type:"armor",amount:2,operation:"add_value",slot:"feet",id:"feet"},\
            {type:"movement_speed",amount:-0.3,operation:"add_multiplied_base",slot:"feet",id:"feet"}]] 1

item replace entity @s hotbar.0 with \
    iron_shovel[unbreakable={},\
        attribute_modifiers=[\
            {type:"attack_damage",amount:7,operation:"add_value",slot:"mainhand",id:"base_attack_damage"},\
            {type:"attack_speed",amount:-3.0,operation:"add_value",slot:"mainhand",id:"base_attack_speed"},\
        ]] 1
item replace entity @s weapon.offhand with \
    zombie_spawn_egg[\
        can_place_on=[{blocks:"#mineable/axe"},{blocks:"#mineable/hoe"},{blocks:"#mineable/pickaxe"},{blocks:"#mineable/shovel"}],\
        entity_data={id:"zombie",Team:"zombie",\
            attributes:[\
                {id:"armor",base:11},\
                {id:"armor_toughness",base:12},\
                {id:"attack_damage",base:4},\
                {id:"knockback_resistance",base:0.2},\
                {id:"max_health",base:5},\
                {id:"movement_speed",base:0.28}]}] 2

# Beetroot Soup
give @s beetroot_soup[food={nutrition:0,saturation:0,can_always_eat:true},consumable={consume_seconds:0,on_consume_effects:[{type:"apply_effects",effects:[{id:"instant_health",amplifier:0,duration:1}]}]},use_remainder={"id":"bowl",count:1}] 20

scoreboard players set @s rZombieEgg 1
team join zombie @s
scoreboard players set @s rBeetSoup 1

