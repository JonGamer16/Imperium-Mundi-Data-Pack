# True Shot (projectile_spawned), as each arrow a True Shot bow fires. Vanilla adds the shooter's
# momentum and a random spread to the arrow; this replaces its velocity with the speed the draw
# alone earned, aimed exactly where the shooter is looking. Gravity and drag are left vanilla.
#
# Shooters without a recent draw record (mobs, or a draw the clock missed) keep the vanilla shot.

execute if score #TsTrace im.temp matches 1 run tellraw @a [{text:"[TS] hook ran, before ",color:"aqua"},{nbt:"Motion",entity:"@s",color:"white"}]

scoreboard players set #tsOk im.temp 0
scoreboard players set #tsGap im.temp -999
scoreboard players set #tsT im.temp -999
# `on origin` is a projectile's shooter; `on owner` is only for tamed animals and finds nobody here.
execute on origin store result score #tsOk im.temp run function imperium:enchantments/true_shot_aim

execute if score #TsTrace im.temp matches 1 run tellraw @a [{text:"[TS] ok=",color:"aqua"},{score:{name:"#tsOk",objective:"im.temp"}}," gap=",{score:{name:"#tsGap",objective:"im.temp"}}," t=",{score:{name:"#tsT",objective:"im.temp"}}," v=",{score:{name:"$x",objective:"im.motion"}}," ",{score:{name:"$y",objective:"im.motion"}}," ",{score:{name:"$z",objective:"im.motion"}}]
execute unless score #tsOk im.temp matches 1 run return fail

# $x/$y/$z im.motion are in 1/10000 blocks/tick.
execute store result entity @s Motion[0] double 0.0001 run scoreboard players get $x im.motion
execute store result entity @s Motion[1] double 0.0001 run scoreboard players get $y im.motion
execute store result entity @s Motion[2] double 0.0001 run scoreboard players get $z im.motion

execute if score #TsTrace im.temp matches 1 run tellraw @a [{text:"[TS] after ",color:"aqua"},{nbt:"Motion",entity:"@s",color:"white"}]
execute if score #TsTrace im.temp matches 1 run tag @s add im.ts_trace
execute if score #TsTrace im.temp matches 1 run schedule function imperium:test/true_shot_trace_late 1t replace
