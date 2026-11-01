# 1. Signal to the main loop that the armor is actively equipped
scoreboard players set @s im_brittleFlag 1

# 2. Calculate net damage (stored_health - current_health, both in tenths)
# health scale 10: 1 heart = 10 units, so 1 damage = 10 units (matching gross damage scale of 10:1)
execute \
    store result score @s im_brittleHealthTemp \
    run data get entity @s Health 10
scoreboard players operation \
    @s im_brittleNetDamage = @s im_brittleHealthPrev
scoreboard players operation \
    @s im_brittleNetDamage -= @s im_brittleHealthTemp


#say DEBUG: brittle TICK - net_damage calculated

# Only add positive damage to accumulated total (ignore healing)
execute \
    if score @s im_brittleNetDamage matches 1.. \
    if score @s im_brittleValidDamage matches 1.. \
    run scoreboard players operation \
        @s im_brittleNetDamageAccum += @s im_brittleNetDamage

# 3. Run the filter if there is actual accumulated damage
# Filter decides whether to call math/update chain based on valid_damage flag
execute \
    if score @s im_brittleNetDamageAccum matches 1.. \
    run function imperium:enchantments/brittle_filter

# 4. Update health snapshot for next damage event
execute \
    store result score @s im_brittleHealthPrev \
    run data get entity @s Health 10

# 5. Reset the valid damage flag for the next game tick
scoreboard players set @s im_brittleValidDamage 0