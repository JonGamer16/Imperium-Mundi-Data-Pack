# 1. Add individual red team kills to the collective Red score
execute \
    as @e[type=#imperium:human,team=red_team,scores={im_kills=1..}] \
    run scoreboard players operation #Red im_tdm_score += @s im_kills

# 2. Add individual blue team kills to the collective Blue score
execute \
    as @e[type=#imperium:human,team=blue_team,scores={im_kills=1..}] \
    run scoreboard players operation #Blue im_tdm_score += @s im_kills

# 3. Reset individual kill trackers immediately so they aren't counted twice
scoreboard players reset @e[type=#imperium:human,scores={im_kills=1..}] im_kills

# 4. Check Win Conditions (10 Kills)
execute if score #Red im_tdm_score matches 10.. run function imperium:gamemodes/team_deathmatch/win_red
execute if score #Blue im_tdm_score matches 10.. run function imperium:gamemodes/team_deathmatch/win_blue