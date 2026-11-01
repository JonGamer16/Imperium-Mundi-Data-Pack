scoreboard players set @s im.dmg 0
$execute \
    store result score @s im.max \
    run data get entity @s $(slot).components."minecraft:max_damage"

# Prevent division by zero if item is unbreakable
execute unless score @s im.max matches 1.. run return 0

$execute \
    store result score @s im.dmg \
    run data get entity @s $(slot).components."minecraft:damage"
scoreboard players operation @s im.dmg *= const 500
scoreboard players operation @s im.dmg /= @s im.max
$scoreboard players operation @s $(target) += @s im.dmg