# Temper tick effect: +0.5% base attack damage per missing HP per level. The modifier goes on the
# player, not the item (rewriting the held item would restart its attack cooldown), so core/tick
# removes it when the weapon is put away. im_health includes absorption, so clamp at 0 missing.
scoreboard players set @s im_temperEq 2
execute unless score @s im_health matches 1.. run return 0

execute if items entity @s weapon.mainhand *[enchantments~[{enchantments:"imperium:legacy/temper",levels:1}]] run scoreboard players set #temper im.temp 1
execute if items entity @s weapon.mainhand *[enchantments~[{enchantments:"imperium:legacy/temper",levels:2}]] run scoreboard players set #temper im.temp 2
execute if items entity @s weapon.mainhand *[enchantments~[{enchantments:"imperium:legacy/temper",levels:3}]] run scoreboard players set #temper im.temp 3
execute if items entity @s weapon.mainhand *[enchantments~[{enchantments:"imperium:legacy/temper",levels:4}]] run scoreboard players set #temper im.temp 4
execute if items entity @s weapon.mainhand *[enchantments~[{enchantments:"imperium:legacy/temper",levels:5}]] run scoreboard players set #temper im.temp 5

# Bonus in tenths of a percent: (max HP - HP) * level * 5
execute store result score #temperBonus im.temp run attribute @s minecraft:max_health get
scoreboard players operation #temperBonus im.temp -= @s im_health
execute if score #temperBonus im.temp matches ..-1 run scoreboard players set #temperBonus im.temp 0
scoreboard players operation #temperBonus im.temp *= #temper im.temp
scoreboard players operation #temperBonus im.temp *= #5 imperium.const

# Only touch the modifier when the bonus changed.
execute if score #temperBonus im.temp = @s im_temperBonus run return 0
scoreboard players operation @s im_temperBonus = #temperBonus im.temp
execute store result storage imperium:legacy temper.amount double 0.001 run scoreboard players get @s im_temperBonus
function imperium:enchantments/legacy/temper_apply with storage imperium:legacy temper
