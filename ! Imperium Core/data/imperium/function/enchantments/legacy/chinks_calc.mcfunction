# Once a second, at the holder. Worn cursed gear lowers stats: a fully worn weapon gives -50% attack
# damage, and all four armor pieces fully worn give -50% armor. Each slot adds 0-500 to its total.
tag @s add im.chinks_self
scoreboard players set @s im_chinksWeapon 0
scoreboard players set @s im_chinksArmor 0
execute if items entity @s weapon.mainhand *[enchantments~[{enchantments:"imperium:legacy/chinks_curse"}]] run function imperium:enchantments/legacy/chinks_slot {slot:"weapon.mainhand",target:"im_chinksWeapon"}
execute if items entity @s armor.head *[enchantments~[{enchantments:"imperium:legacy/chinks_curse"}]] run function imperium:enchantments/legacy/chinks_slot {slot:"armor.head",target:"im_chinksArmor"}
execute if items entity @s armor.chest *[enchantments~[{enchantments:"imperium:legacy/chinks_curse"}]] run function imperium:enchantments/legacy/chinks_slot {slot:"armor.chest",target:"im_chinksArmor"}
execute if items entity @s armor.legs *[enchantments~[{enchantments:"imperium:legacy/chinks_curse"}]] run function imperium:enchantments/legacy/chinks_slot {slot:"armor.legs",target:"im_chinksArmor"}
execute if items entity @s armor.feet *[enchantments~[{enchantments:"imperium:legacy/chinks_curse"}]] run function imperium:enchantments/legacy/chinks_slot {slot:"armor.feet",target:"im_chinksArmor"}
tag @s remove im.chinks_self

# Only touch the modifiers when a value changed.
execute if score @s im_chinksWeapon = @s im_chinksWeaponPrev if score @s im_chinksArmor = @s im_chinksArmorPrev run return 0
scoreboard players operation @s im_chinksWeaponPrev = @s im_chinksWeapon
scoreboard players operation @s im_chinksArmorPrev = @s im_chinksArmor
execute store result storage imperium:legacy chinks.weapon double -0.001 run scoreboard players get @s im_chinksWeapon
execute store result storage imperium:legacy chinks.armor double -0.00025 run scoreboard players get @s im_chinksArmor
function imperium:enchantments/legacy/chinks_apply with storage imperium:legacy chinks
