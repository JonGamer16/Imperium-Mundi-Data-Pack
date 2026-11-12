# Macro {slot, target}. Wear of one slot on a temporary display, added to the target score.
$execute summon item_display run function imperium:enchantments/legacy/chinks_probe {slot:"$(slot)"}
$scoreboard players operation @s $(target) += #chinksWear im.temp
