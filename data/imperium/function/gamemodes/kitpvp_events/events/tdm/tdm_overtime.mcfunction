# State 4: Overtime. Timer: 2 minutes (2400 ticks)
scoreboard players set #EVENT im_event_state 4
scoreboard players set #EVENT im_event_timer 2400

tellraw @a ["",\
    {"text":"[Event] ",\
        "color":"gold"},\
    {"text":"Time's up! Scores are tied. 2-Minute Sudden Death Overtime! Next kill wins.",\
        "color":"light_purple"}]

# Timer Bar Display

bossbar set imperium:event_timer max 2400
bossbar set imperium:event_timer color purple
bossbar set imperium:event_timer name {"text":"Sudden Death Overtime!","color":"light_purple"}