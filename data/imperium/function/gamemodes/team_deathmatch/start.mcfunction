# 1. Change Game State to Active
scoreboard players set #TDM im_tdm_state 1

# 2. Reset Scores for a fresh game
scoreboard players set #Red im_tdm_score 0
scoreboard players set #Blue im_tdm_score 0
scoreboard players reset * im_kills

# 3. Teleport teams to their respective spawns (Replace coordinates)
tp @e[type=#imperium:human,team=red_team] -5 31 -6
tp @e[type=#imperium:human,team=blue_team] -5 31 6

# 4. Announce Start
title @a title {"text":"TDM Started!","color":"gold"}
title @a subtitle {"text":"First to 10 Kills Wins","color":"gray"}