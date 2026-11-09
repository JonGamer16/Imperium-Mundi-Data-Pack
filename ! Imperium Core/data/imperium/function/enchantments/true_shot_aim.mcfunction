# True Shot, as the shooter of a True Shot arrow. Sets $x/$y/$z im.motion to the arrow's clean
# velocity and returns 1, or fails if there is no draw record for this shot.
#
# Vanilla bow: f = ticks/20, power = (f^2 + 2f)/3 capped at 1, speed = power * 3 blocks/tick.
# In 1/10000 b/t that is 25 * t * (t + 40), with t capped at 20 (= 30000, a full draw).

execute unless entity @s[type=player] run return fail

# The draw must have been seen this tick or the last one, or the record is from an old draw.
execute store result score #tsNow im.temp run time query gametime
scoreboard players operation #tsGap im.temp = #tsNow im.temp
scoreboard players operation #tsGap im.temp -= @s im_tsLast
execute unless score #tsGap im.temp matches 0..1 run return fail

# t = ticks drawn, counting the first tick.
scoreboard players operation #tsT im.temp = @s im_tsLast
scoreboard players operation #tsT im.temp -= @s im_tsStart
scoreboard players add #tsT im.temp 1
execute if score #tsT im.temp matches 21.. run scoreboard players set #tsT im.temp 20

scoreboard players operation $strength im.motion = #tsT im.temp
scoreboard players add $strength im.motion 40
scoreboard players operation $strength im.motion *= #tsT im.temp
scoreboard players set #tsC im.temp 25
scoreboard players operation $strength im.motion *= #tsC im.temp

# Forward vector from the shooter's own view, not the arrow's (already spread) rotation.
execute rotated as @s run function imperium:motion/get_looking
return 1
