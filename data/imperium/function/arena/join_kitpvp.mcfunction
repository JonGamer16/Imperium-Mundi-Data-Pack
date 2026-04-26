execute store result storage imperium:player_data player_uuid long 1 \
    run data get entity @s UUID

execute as @s run \
    function pdb:new_player