# 1. Change Game State back to Lobby
scoreboard players set #TDM im_tdm_state 0

# 2. Teleport everyone back to the lobby (Replace coordinates)
tp @a 0 31 0

# 3. Clear inventories, remove status effects, heal
clear @a
effect clear @a
effect give @a instant_health 5