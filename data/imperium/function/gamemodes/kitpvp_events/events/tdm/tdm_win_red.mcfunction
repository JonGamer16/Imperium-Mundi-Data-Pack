tellraw @a ["",\
    {"text":"[Event] ",\
        "color":"gold"},\
    {"text":"Red Team wins the Team Deathmatch!",\
        "color":"red"}]
tellraw @a[team=event_red] ["",\
    {"text":"[Event] ",\
        "color":"gold"},\
    {"text":"Awarded 2,000 gold",\
        "color":"yellow"}]

scoreboard players add @a[team=event_red] gold 2000

function imperium:gamemodes/kitpvp_events/cancel_event

bossbar set imperium:event_timer visible false