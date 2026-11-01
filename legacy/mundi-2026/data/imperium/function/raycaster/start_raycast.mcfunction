say start_raycast
tag @s add im.raycasting

#execute \
    anchored eyes \
    positioned ^ ^ ^ \
    run function imperium:raycaster/start_raycast

tag @s remove im.raycasting
scoreboard players reset .distance im_raycast