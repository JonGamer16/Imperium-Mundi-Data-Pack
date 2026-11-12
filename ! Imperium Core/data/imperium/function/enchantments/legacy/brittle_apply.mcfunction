# Macro {slot, piece}. A pristine item has no damage component, so start from 0.
scoreboard players set #brittle im.temp 0
$execute store result score #brittle im.temp run data get entity @s equipment.$(piece).components."minecraft:damage"
scoreboard players operation #brittle im.temp += @s im_brittleDura
$data modify storage imperium:legacy brittle.slot set value "$(slot)"
execute store result storage imperium:legacy brittle.damage int 1 run scoreboard players get #brittle im.temp
function imperium:enchantments/legacy/brittle_set with storage imperium:legacy brittle
