scoreboard players set #EVENT im_event_state 0

scoreboard players set #EVENT im_proposals 0

tellraw @a ["",\
    {"text":"[Event] ",\
        "color":"gold"},\
    {"text":"Not enough votes. Event cancelled.",\
        "color":"red"}]

bossbar set imperium:event_timer visible false