# Macro {slot}. @s = the temporary display. An item's NBT only lists max_damage when it was changed
# from the default, so measure it: set_damage 0 sets damage to the maximum on this copy.
$item replace entity @s contents from entity @a[tag=im.chinks_self,limit=1] $(slot)
scoreboard players set #chinksWear im.temp 0
scoreboard players set #chinksMax im.temp 0
execute store result score #chinksWear im.temp run data get entity @s item.components."minecraft:damage"
item modify entity @s contents {type:"minecraft:set_damage",damage:0}
execute store result score #chinksMax im.temp run data get entity @s item.components."minecraft:damage"
kill @s
# Unbreakable items have no maximum: they count as unworn.
execute unless score #chinksMax im.temp matches 1.. run return run scoreboard players set #chinksWear im.temp 0
scoreboard players operation #chinksWear im.temp *= #500 imperium.const
scoreboard players operation #chinksWear im.temp /= #chinksMax im.temp
