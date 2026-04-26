# 1. Enable Triggers for all players
scoreboard players enable @a im_propose
scoreboard players enable @a im_vote

# 2. Process Proposals (State 0: Idle)
execute \
    if score #EVENT im_event_state matches 0 \
    as @e[type=#imperium:human,scores={im_propose=1..}] \
    run function imperium:gamemodes/kitpvp_events/cast_proposal

# 3. Process Votes (State 1: Voting)
execute \
    if score #EVENT im_event_state matches 1 \
    as @e[type=#imperium:human,scores={im_vote=1..,im_has_voted=0}] \
    run function imperium:gamemodes/kitpvp_events/cast_vote

# 4. Cleanup Triggers so they don't loop endlessly
scoreboard players reset @e[type=#imperium:human,scores={im_propose=1..}] im_propose
scoreboard players reset @e[type=#imperium:human,scores={im_vote=1..}] im_vote

# 5. Timer Logic (States 1 & 2)
execute \
    if score #EVENT im_event_state matches 1.. \
    run scoreboard players remove #EVENT im_event_timer 1

# 6. Evaluate State Outcomes
    # Voting Phase (State 1) check for pass/fail
    execute \
        if score #EVENT im_event_state matches 1 \
        run function imperium:gamemodes/kitpvp_events/eval_vote

    # Starting Phase (State 2) countdown completion
    execute \
        if score #EVENT im_event_state matches 2 \
        if score #EVENT im_event_timer matches ..0 \
        run function imperium:gamemodes/kitpvp_events/start_game

# 7. Update Bossbar Timer & Visibility
execute \
    if score #EVENT im_event_state matches 1..4 \
    store result bossbar imperium:event_timer value \
    run scoreboard players get #EVENT im_event_timer
execute \
    if score #EVENT im_event_state matches 1..4 \
    run bossbar set imperium:event_timer players @a

# Team Deathmatch Loop
execute \
    if score #EVENT im_event_type matches 1 \
    if score #EVENT im_event_state matches 3..4 \
    run function imperium:gamemodes/kitpvp_events/events/tdm/tdm_loop
