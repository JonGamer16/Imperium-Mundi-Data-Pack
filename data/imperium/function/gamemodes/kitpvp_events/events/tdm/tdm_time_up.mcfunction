execute if score #RED_SCORE im_event_req > #BLUE_SCORE im_event_req run function imperium:gamemodes/kitpvp_events/events/tdm/tdm_win_red
execute if score #BLUE_SCORE im_event_req > #RED_SCORE im_event_req run function imperium:gamemodes/kitpvp_events/events/tdm/tdm_win_blue

# If tied, trigger overtime
execute if score #RED_SCORE im_event_req = #BLUE_SCORE im_event_req run function imperium:gamemodes/kitpvp_events/events/tdm/tdm_overtime