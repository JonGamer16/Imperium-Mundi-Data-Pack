# Lock the event type to the first player's choice
execute \
    if score #EVENT im_proposals matches 0 \
    run scoreboard players operation #EVENT im_event_type = @s im_propose

scoreboard players add #EVENT im_proposals 1

# Broadcast based on the locked event type
execute \
    if score #EVENT im_event_type matches 1 \
    run tellraw @a [{"text":"[Event] ","color":"gold"},{"selector":"@s"},{"text":" proposed a Team Deathmatch! (/trigger im_propose set 1)","color":"yellow"}]
execute \
    if score #EVENT im_event_type matches 2 \
    run tellraw @a [{"text":"[Event] ","color":"gold"},{"selector":"@s"},{"text":" proposed a Free-For-All! (/trigger im_propose set 2)","color":"yellow"}]

# If 2 proposals are reached, start the vote
execute \
    if score #EVENT im_proposals matches 2.. \
    run function imperium:gamemodes/kitpvp_events/start_vote