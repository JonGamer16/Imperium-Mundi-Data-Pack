# --- RED TEAM KILL ---
execute if entity @s[team=event_red] run scoreboard players set #MATH_BASE im_event_req 20
execute if entity @s[team=event_red] run scoreboard players operation #MATH_BASE im_event_req += #RED_SIZE im_event_req
execute if entity @s[team=event_red] run scoreboard players remove #MATH_BASE im_event_req 1
execute if entity @s[team=event_red] run scoreboard players operation #MATH_BASE im_event_req /= #RED_SIZE im_event_req
execute if entity @s[team=event_red] run scoreboard players operation #RED_SCORE im_event_req += #MATH_BASE im_event_req

# --- BLUE TEAM KILL ---
execute if entity @s[team=event_blue] run scoreboard players set #MATH_BASE im_event_req 20
execute if entity @s[team=event_blue] run scoreboard players operation #MATH_BASE im_event_req += #BLUE_SIZE im_event_req
execute if entity @s[team=event_blue] run scoreboard players remove #MATH_BASE im_event_req 1
execute if entity @s[team=event_blue] run scoreboard players operation #MATH_BASE im_event_req /= #BLUE_SIZE im_event_req
execute if entity @s[team=event_blue] run scoreboard players operation #BLUE_SCORE im_event_req += #MATH_BASE im_event_req

# --- SUDDEN DEATH RESOLUTION ---
execute if score #EVENT im_event_state matches 4 if entity @s[team=event_red] run function imperium:gamemodes/kitpvp_events/events/tdm/tdm_win_red
execute if score #EVENT im_event_state matches 4 if entity @s[team=event_blue] run function imperium:gamemodes/kitpvp_events/events/tdm/tdm_win_blue

# Reset kill score for the player
scoreboard players reset @s im_kills