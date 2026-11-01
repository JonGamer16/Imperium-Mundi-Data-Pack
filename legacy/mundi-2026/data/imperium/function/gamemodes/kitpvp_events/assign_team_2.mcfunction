# Assign team based on current toggle state
execute \
    if score #TEAM_TOGGLE im_event_req matches 0 \
    run team join event_red @s
execute \
    if score #TEAM_TOGGLE im_event_req matches 1 \
    run team join event_blue @s

# Flip the toggle safely for the next player
execute \
    if score #TEAM_TOGGLE im_event_req matches 0 \
    run scoreboard players set #TEMP_TOGGLE im_event_req 1
execute \
    if score #TEAM_TOGGLE im_event_req matches 1 \
    run scoreboard players set #TEMP_TOGGLE im_event_req 0
    
scoreboard players operation #TEAM_TOGGLE im_event_req = #TEMP_TOGGLE im_event_req