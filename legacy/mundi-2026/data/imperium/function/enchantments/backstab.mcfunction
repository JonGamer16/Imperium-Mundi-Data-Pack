# Reset flags (0 = searching, 1 = success, 2 = failed/wrong angle)
scoreboard players set @s im_backstabflag 0
scoreboard players set @s im_backstabraycast 0

# Store the attacker's rotation
execute \
    store result score @s im_rotation \
    run data get entity @s Rotation[0] 1

# Start the raycast from the eyes
execute \
    at @s \
    anchored eyes \
    positioned ^ ^ ^ \
    run function imperium:enchantments/backstab_raycast