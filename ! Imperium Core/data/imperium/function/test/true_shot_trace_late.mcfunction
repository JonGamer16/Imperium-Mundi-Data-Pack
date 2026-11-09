# Scheduled 1t after a traced True Shot arrow spawns: the server's Motion after its first tick.
# Expect the "after" vector x0.99 drag, minus 0.05 on y. A vanilla-looking vector here means
# something overwrote it server-side; a matching one means only the client shows the old path.
execute as @e[type=#minecraft:arrows,tag=im.ts_trace] run tellraw @a [{text:"[TS] +1t ",color:"aqua"},{nbt:"Motion",entity:"@s",color:"white"}]
tag @e[type=#minecraft:arrows,tag=im.ts_trace] remove im.ts_trace
