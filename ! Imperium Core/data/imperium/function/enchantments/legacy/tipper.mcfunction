# Tipper tick effect: find how far along the look line the first target sits, in 1/10 blocks, with
# the line capped at the holder's reach. The damage effect reads im_tipper: 0 = sour spot (first
# third of reach), 1 = normal or no target, 2 = sweet spot (last fifth of reach).
scoreboard players set @s im_tipper 1
execute store result score @s im_tipperReach run attribute @s minecraft:entity_interaction_range get 10

# Most ticks have nothing in reach, so skip the line entirely.
tag @s add im.tipper_self
scoreboard players set @s im_tipperStep 0
scoreboard players set #tipperHit im.temp 0
execute at @s if entity @e[type=!#imperium:legacy/not_mob,tag=!im.tipper_self,distance=..8] anchored eyes positioned ^ ^ ^ run function imperium:enchantments/legacy/tipper_raycast
tag @s remove im.tipper_self
execute unless score #tipperHit im.temp matches 1 run return 0

scoreboard players operation #tipperSpot im.temp = @s im_tipperReach
scoreboard players operation #tipperSpot im.temp /= #3 imperium.const
execute if score @s im_tipperStep <= #tipperSpot im.temp run scoreboard players set @s im_tipper 0
scoreboard players operation #tipperSpot im.temp = @s im_tipperReach
scoreboard players operation #tipperSpot im.temp /= #5 imperium.const
scoreboard players operation #tipperSpot im.temp *= #-1 imperium.const
scoreboard players operation #tipperSpot im.temp += @s im_tipperReach
execute if score @s im_tipperStep >= #tipperSpot im.temp run scoreboard players set @s im_tipper 2
