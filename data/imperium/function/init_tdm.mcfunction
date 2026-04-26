# Create Teams
team add red_team "Red Team"
team modify red_team color red
team add blue_team "Blue Team"
team modify blue_team color blue

# Create Objectives
scoreboard objectives add im_tdm_state dummy
scoreboard objectives add im_kills playerKillCount
scoreboard objectives add im_tdm_score dummy

# Initialize Global Variables using Fake Players
scoreboard players set #TDM im_tdm_state 0
scoreboard players set #Red im_tdm_score 0
scoreboard players set #Blue im_tdm_score 0

# Game States:
#   #TDM im_tdm_state 0 - Lobby
#   #TDM im_tdm_state 1 - In-Game
#   #TDM im_tdm_state 2 - Post-Game