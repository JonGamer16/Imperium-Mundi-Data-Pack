# True Shot draw clock: reward of imperium:enchantments/true_shot_draw, which fires every tick a
# player draws a True Shot bow. Records the tick the draw started (im_tsStart) and the last tick it
# was seen (im_tsLast); true_shot_aim turns that into draw time when the arrow spawns. No tick
# function: a gap of more than one tick since im_tsLast means this is a new draw.

advancement revoke @s only imperium:enchantments/true_shot_draw

execute store result score #tsNow im.temp run time query gametime
scoreboard players operation #tsGap im.temp = #tsNow im.temp
scoreboard players operation #tsGap im.temp -= @s im_tsLast
execute unless score #tsGap im.temp matches 1 run scoreboard players operation @s im_tsStart = #tsNow im.temp
scoreboard players operation @s im_tsLast = #tsNow im.temp
