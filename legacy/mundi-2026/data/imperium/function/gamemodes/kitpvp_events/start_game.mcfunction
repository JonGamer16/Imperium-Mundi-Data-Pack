# Shift to State 3 (Active Game)
scoreboard players set #EVENT im_event_state 3
scoreboard players set #EVENT im_proposals 0

# Route to the correct event initialization
execute \
    if score #EVENT im_event_type matches 1 \
    run function imperium:gamemodes/kitpvp_events/events/tdm/tdm_start
execute \
    if score #EVENT im_event_type matches 2 \
    run function imperium:gamemodes/kitpvp_events/events/start_ffa_deathmatch