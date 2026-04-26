tellraw @a ["",\
    {"text":"[Event] ",\
        "color":"gold"},\
    {"text":"Overtime expired without a kill. The match is a draw.",\
        "color":"gray"}]

function imperium:gamemodes/kitpvp_events/cancel_event

bossbar set imperium:event_timer visible false