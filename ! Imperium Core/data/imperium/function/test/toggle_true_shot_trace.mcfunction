# /function imperium:test/toggle_true_shot_trace -> on every True Shot arrow, print each step of
# enchantments/true_shot: hook ran, draw record, computed velocity, Motion before/after, and the
# server's Motion one tick later. Survives /reload.
execute store success score #TsTrace im.temp unless score #TsTrace im.temp matches 1
execute if score #TsTrace im.temp matches 1 run tellraw @s {text:"True Shot trace ON",color:"gold"}
execute if score #TsTrace im.temp matches 0 run tellraw @s {text:"True Shot trace OFF",color:"gray"}
