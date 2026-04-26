# Shift to State 2 (Starting) and cap timer to 10s (200 ticks)
scoreboard players set #EVENT im_event_state 2

scoreboard players set #EVENT im_event_timer 200

tellraw @a ["",\
    {"text":"[Event] ",\
        "color":"gold"},\
    {"text":"Vote passed! Teams assigning in 10 seconds!",\
        "color":"green"}]

# Timer Bar

bossbar set imperium:event_timer max 200
bossbar set imperium:event_timer color green
bossbar set imperium:event_timer name {"text":"Assigning Teams...","color":"green"}