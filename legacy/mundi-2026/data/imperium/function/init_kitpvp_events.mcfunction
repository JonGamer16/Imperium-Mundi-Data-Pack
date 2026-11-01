# Event State & Timers
scoreboard objectives add im_event_state dummy
scoreboard objectives add im_event_timer dummy
scoreboard objectives add im_event_type dummy

# Event Objectives
scoreboard objectives add im_event_kills playerKillCount
scoreboard objectives add im_event_score dummy

# Voting Math & Triggers
scoreboard objectives add im_event_req dummy
scoreboard objectives add im_event_votes dummy
scoreboard objectives add im_has_voted dummy
scoreboard objectives add im_proposals dummy
scoreboard objectives add im_propose trigger
scoreboard objectives add im_vote trigger

# Team Setup (No Friendly Fire)
team add event_red "Red Team"
team modify event_red color red
team modify event_red friendlyFire false

team add event_blue "Blue Team"
team modify event_blue color blue
team modify event_blue friendlyFire false

team add event_green "Green Team"
team modify event_green color green
team modify event_green friendlyFire false

team add event_yellow "Yellow Team"
team modify event_yellow color yellow
team modify event_yellow friendlyFire false

# Team Setup (FFA)
team add event_ffa "FFA"
team modify event_ffa color gold
team modify event_ffa friendlyFire true

# Initialize global tracking
scoreboard players set #EVENT im_event_state 0
scoreboard players set #EVENT im_event_type 0
scoreboard players set #EVENT im_proposals 0

# Timer Bar
bossbar add imperium:event_timer "Event Timer"
bossbar set imperium:event_timer visible false