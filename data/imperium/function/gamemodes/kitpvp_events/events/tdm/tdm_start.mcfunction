team leave @a

scoreboard players set #TEAM_TOGGLE im_event_req 0

execute \
    as @e[type=#imperium:human,sort=random] \
    run function imperium:gamemodes/kitpvp_events/assign_team_2

# Reset TDM variables
scoreboard players set #RED_SCORE im_event_req 0
scoreboard players set #BLUE_SCORE im_event_req 0
scoreboard players reset @a im_kills

# Set Timer: 8 minutes (9600 ticks) and State: 3 (Active)
scoreboard players set #EVENT im_event_timer 9600
scoreboard players set #EVENT im_event_state 3

tellraw @a ["",\
    {"text":"[Event] ",\
        "color":"gold"},\
    {"text":"Team Deathmatch has begun! Friendly fire is OFF.",\
        "color":"green"}]

# Timer Bar Display

bossbar set imperium:event_timer max 9600
bossbar set imperium:event_timer color red
bossbar set imperium:event_timer name {"text":"Team Deathmatch","color":"red"}