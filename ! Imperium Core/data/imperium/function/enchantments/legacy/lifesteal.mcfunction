# Life Steal tick effect (legacy version: heals directly, unlike Kit PvP's soup bank). Each 2 HP dealt
# heals 1 HP. im_legacyLsDealt counts every hit, so whatever was dealt before this weapon came out
# is dropped: core/tick runs im_legacyLsEq down, and it's only set here.
execute unless score @s im_legacyLsEq matches 1.. run scoreboard players set @s im_legacyLsDealt 0
scoreboard players set @s im_legacyLsEq 2
execute unless score @s im_legacyLsDealt matches 20.. run return 0

# Regeneration XII heals 1 HP per tick, so the duration is the HP healed. At most 10 per tick.
scoreboard players operation #lsHeal im.temp = @s im_legacyLsDealt
scoreboard players operation #lsHeal im.temp /= #20 imperium.const
execute if score #lsHeal im.temp matches 11.. run scoreboard players set #lsHeal im.temp 10
execute store result storage imperium:legacy lifesteal.ticks int 1 run scoreboard players get #lsHeal im.temp
scoreboard players operation #lsHeal im.temp *= #20 imperium.const
scoreboard players operation @s im_legacyLsDealt -= #lsHeal im.temp
function imperium:enchantments/legacy/lifesteal_heal with storage imperium:legacy lifesteal
