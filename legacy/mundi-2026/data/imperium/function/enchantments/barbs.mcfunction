# 1. Identify players holding a rod with the Barbs enchantment
tag @a remove barbs_user
execute \
    as @a \
    if items entity @s weapon.mainhand \
        *[minecraft:enchantments~[{enchantments:"imperium:barbs",levels:{min:1}}]] \
    run tag @s add barbs_user
execute \
    as @a \
    if items entity @s weapon.offhand \
        *[minecraft:enchantments~[{enchantments:"imperium:barbs",levels:{min:1}}]] \
    run tag @s add barbs_user

# 2. Tag newly cast bobbers belonging to these players (checks proximity upon bobber spawn)
execute \
    as @e[type=fishing_bobber,tag=!checked] \
    at @s \
    if entity @a[tag=barbs_user,distance=..3] \
    run tag @s add barbed_bobber
tag @e[type=fishing_bobber,tag=!checked] add checked

# 3. Detect entities caught by the barbed bobber
execute \
    as @e[type=fishing_bobber,tag=barbed_bobber] \
    at @s \
    run tag @n[distance=0.1..1.5,type=!player] add hooked_by_barbs

# 4. Apply damage once per hook (2 damage = 1 heart) attributed to the user
execute \
    as @e[tag=hooked_by_barbs,tag=!barbs_damaged,type=!#im.not_mob] \
    run damage @s 2 minecraft:player_attack \
        by @p[tag=barbs_user]
tag @e[tag=hooked_by_barbs] add barbs_damaged

# 5. Reset entity tags when the bobber is no longer attached
execute \
    as @e[tag=hooked_by_barbs] \
    at @s \
    unless entity @e[type=fishing_bobber,tag=barbed_bobber,distance=..2] \
    run tag @s remove barbs_damaged
execute \
    as @e[tag=hooked_by_barbs] \
    at @s \
    unless entity @e[type=fishing_bobber,tag=barbed_bobber,distance=..2] \
    run tag @s remove hooked_by_barbs