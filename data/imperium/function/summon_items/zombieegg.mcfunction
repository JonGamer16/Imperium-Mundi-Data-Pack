clear @s zombie_spawn_egg
give @s zombie_spawn_egg[can_place_on=[{blocks:"#mineable/axe"},{blocks:"#mineable/pickaxe"},{blocks:"#mineable/shovel"},{blocks:"#mineable/hoe"}],entity_data={id:"zombie",Team:"zombie",attributes:[{id:"armor",base:11},{id:"armor_toughness",base:12},{id:"attack_damage",base:4},{id:"knockback_resistance",base:0.2},{id:"max_health",base:5},{id:"movement_speed",base:0.28}]}] 1
give @s zombie_spawn_egg[can_place_on=[{blocks:"#mineable/axe"},{blocks:"#mineable/pickaxe"},{blocks:"#mineable/shovel"},{blocks:"#mineable/hoe"}],entity_data={id:"zombie",Team:"zombie",attributes:[{id:"armor",base:11},{id:"armor_toughness",base:12},{id:"attack_damage",base:4},{id:"knockback_resistance",base:0.2},{id:"max_health",base:5},{id:"movement_speed",base:0.28}]}] 2
scoreboard players remove @s itemreload 150

# Armor: 11
# Toughness: 12
# Attack Damage: 4
# Max Health: 5
# Movement Speed: 0.28 (120%)