# Get total players
execute store result score #EVENT_PLAYERS im_event_req if entity @e[type=#imperium:human]

# Math: Required = (Total / 2)
scoreboard players operation #EVENT im_event_req = #EVENT_PLAYERS im_event_req
scoreboard players operation #EVENT im_event_req /= const 2

# Math: Remainder = (Total % 2)
scoreboard players operation #EVENT_REM im_event_req = #EVENT_PLAYERS im_event_req
scoreboard players operation #EVENT_REM im_event_req %= const 2

# Math: Required = Required + Remainder
scoreboard players operation #EVENT im_event_req += #EVENT_REM im_event_req

# Condition A: The required votes are met
execute \
    if score #EVENT im_event_votes >= #EVENT im_event_req \
    run function imperium:gamemodes/kitpvp_events/vote_pass

# Condition B: The timer runs out before votes are met
execute \
    if score #EVENT im_event_timer matches ..0 \
    run function imperium:gamemodes/kitpvp_events/vote_fail

# Condition C: Team Deathmatch requires at least 4 players. Cancel if not met
execute \
    if score #EVENT im_event_type matches 1 \
    if score #EVENT_PLAYERS im_event_req matches ..3 \
    run scoreboard players set #EVENT im_event_votes -1
execute \
    if score #EVENT im_event_type matches 1 \
    if score #EVENT_PLAYERS im_event_req matches ..3 \
    run tellraw @a ["",\
        {"text":"[Event] ",\
            "color":"gold"},\
        {"text":"TDM requires at least 4 players in KitPvP. Vote failed.",\
            "color":"red"}]