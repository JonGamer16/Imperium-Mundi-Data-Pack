# Bank the hit in 1/10 HP, spend whole HP as durability, keep the remainder for the next hit.
scoreboard players set @s im_brittleHit 0
scoreboard players operation @s im_brittleDura = @s im_brittleTaken
scoreboard players operation @s im_brittleDura -= @s im_brittlePrev
scoreboard players operation @s im_brittleBank += @s im_brittleDura
scoreboard players operation @s im_brittleDura = @s im_brittleBank
scoreboard players operation @s im_brittleDura /= #10 imperium.const
scoreboard players operation @s im_brittleBank %= #10 imperium.const
execute unless score @s im_brittleDura matches 1.. run return 0
execute if items entity @s armor.head *[enchantments~[{enchantments:"imperium:legacy/brittle_curse"}]] run function imperium:enchantments/legacy/brittle_apply {slot:"armor.head",piece:"head"}
execute if items entity @s armor.chest *[enchantments~[{enchantments:"imperium:legacy/brittle_curse"}]] run function imperium:enchantments/legacy/brittle_apply {slot:"armor.chest",piece:"chest"}
execute if items entity @s armor.legs *[enchantments~[{enchantments:"imperium:legacy/brittle_curse"}]] run function imperium:enchantments/legacy/brittle_apply {slot:"armor.legs",piece:"legs"}
execute if items entity @s armor.feet *[enchantments~[{enchantments:"imperium:legacy/brittle_curse"}]] run function imperium:enchantments/legacy/brittle_apply {slot:"armor.feet",piece:"feet"}
