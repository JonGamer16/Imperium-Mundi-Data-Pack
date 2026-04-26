# Calculate the whole number of durability damage from the accumulated total
scoreboard players operation @s im_brittleDura = @s im_brittleNetDamageAccum
scoreboard players operation @s im_brittleDura /= const 10

# Keep only the remainder for next tick (e.g., if total was 15, keep 5)
scoreboard players operation @s im_brittleNetDamageAccum %= const 10

# If the whole number is 1 or greater, run the minecart macro update
execute \
    if score @s im_brittleDura matches 1.. \
    run function imperium:enchantments/brittle_update

#say brittle_math
