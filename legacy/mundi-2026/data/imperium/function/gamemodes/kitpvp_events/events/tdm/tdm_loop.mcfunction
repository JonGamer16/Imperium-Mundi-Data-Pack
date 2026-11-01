# 1. Update Team Sizes
execute store result score #RED_SIZE im_event_req if entity @a[team=event_red]
execute store result score #BLUE_SIZE im_event_req if entity @a[team=event_blue]

# 2. Process Kills
execute \
    as @a[scores={im_kills=1..}] \
    run function imperium:gamemodes/kitpvp_events/events/tdm/tdm_process_kill

# 3. Check Standard Win Condition (100 Points)
execute \
    if score #EVENT im_event_state matches 3 \
    if score #RED_SCORE im_event_req matches 100.. \
    run function imperium:gamemodes/kitpvp_events/events/tdm/tdm_win_red
execute \
    if score #EVENT im_event_state matches 3 \
    if score #BLUE_SCORE im_event_req matches 100.. \
    run function imperium:gamemodes/kitpvp_events/events/tdm/tdm_win_blue

# 4. Timer Expiration Logic (State 3 -> End or Overtime)
execute \
    if score #EVENT im_event_state matches 3 \
    if score #EVENT im_event_timer matches ..0 \
    run function imperium:gamemodes/kitpvp_events/events/tdm/tdm_time_up

# 5. Overtime Timer Expiration (State 4 -> Draw)
execute \
    if score #EVENT im_event_state matches 4 \
    if score #EVENT im_event_timer matches ..0 \
    run function imperium:gamemodes/kitpvp_events/events/tdm/tdm_draw