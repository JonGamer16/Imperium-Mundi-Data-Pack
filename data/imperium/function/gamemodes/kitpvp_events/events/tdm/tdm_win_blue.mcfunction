tellraw @a ["",\
    {"text":"[Event] ",\
        "color":"gold"},\
    {"text":"Blue Team wins the Team Deathmatch!",\
        "color":"blue"}]
tellraw @a[team=event_blue] ["",\
    {"text":"[Event] ",\
        "color":"gold"},\
    {"text":"Awarded 2,000 gold",\
        "color":"yellow"}]

scoreboard players add @a[team=event_blue] gold 20

function imperium:gamemodes/kitpvp_events/cancel_event

bossbar set imperium:event_timer visible false