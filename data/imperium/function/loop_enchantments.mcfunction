# Brittle Score Control: Reset net damage if Brittle armor is not equipped
    # If brittle.mcfunction didn't run this tick (flag stayed 0), armor is off, so zero the accumulated damage
    execute \
        as @a \
        unless score @s im_brittleFlag matches 1 \
        run scoreboard players set @s im_brittleNetDamage 0
    execute \
        as @a \
        unless score @s im_brittleFlag matches 1 \
        run scoreboard players set @s im_brittleNetDamageAccum 0

    # Reset everyone's flag to 0 for the start of the next tick
    scoreboard players set @a im_brittleFlag 0

# Process fishing rod damage on the exact tick it hooks; maybe unnecessary
execute \
    as @e[type=fishing_bobber,tag=!hook_processed] \
    if entity @n[type=!#im.not_mob,distance=0..0.1] \
    run function imperium:enchantments/barbs

# Chinks Curse Items
execute as @a[tag=im.chinks_curse] run function imperium:enchantments/chinks_calc
execute as @a[tag=im.had_chinks,tag=!im.chinks_curse] run function imperium:enchantments/chinks_remove

tag @a remove im.had_chinks
tag @a[tag=im.chinks_curse] add im.had_chinks
tag @a[tag=im.chinks_curse] remove im.chinks_curse