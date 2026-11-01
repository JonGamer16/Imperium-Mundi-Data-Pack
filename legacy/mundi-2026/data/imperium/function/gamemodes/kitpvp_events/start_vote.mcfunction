# Set state to 1 (Voting) and timer to 60s (1200 ticks)
scoreboard players set #EVENT im_event_state 1
scoreboard players set #EVENT im_event_timer 1200
scoreboard players set #EVENT im_event_votes 0
scoreboard players set @a im_has_voted 0

# Broadcast
execute if score #EVENT im_event_type matches 1 \
    run tellraw @a \
        [\
            "",\
            {"text":"[Event] ",\
                "color":"gold"},\
            {"text":"A vote for Team Deathmatch has started! Type ",\
                "color":"yellow"},\
            {"text":"/trigger im_vote",\
                "color":"green",\
                "click_event":{"action":"run_command","command":"/trigger im_vote"},\
                "hover_event":{"action":"show_text","value":"Click to vote!"}},\
            {"text":" to vote! (60s)",\
                "color":"yellow"}\
        ]
execute if score #EVENT im_event_type matches 2 \
    run tellraw @a \
        [\
            "",\
            {"text":"[Event] ",\
                "color":"gold"},\
            {"text":"A vote for FFA Deathmatch has started! Type or click ",\
                "color":"yellow"},\
            {"text":"/trigger im_vote",\
                "color":"green",\
                "click_event":{"action":"run_command","command":"/trigger im_vote"},\
                "hover_event":{"action":"show_text","value":"Click to vote!"}},\
            {"text":" to vote! (60s)",\
                "color":"yellow"}\
        ]

# Timer Bar Display
execute \
    if score #EVENT im_event_type matches 1 \
    run bossbar set imperium:event_timer name \
        {"text":"Voting for Event: FFA Deathmatch ( /trigger im_vote )",\
            "color":"yellow"}
execute \
    if score #EVENT im_event_type matches 1 \
    run bossbar set imperium:event_timer name \
        {"text":"Voting for Event: Team Deathmatch ( /trigger im_vote )",\
            "color":"yellow"}
bossbar set imperium:event_timer max 1200
bossbar set imperium:event_timer color yellow
bossbar set imperium:event_timer visible true