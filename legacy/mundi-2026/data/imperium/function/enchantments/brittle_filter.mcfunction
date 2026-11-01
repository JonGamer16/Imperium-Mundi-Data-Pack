# Process accumulated damage
# Always apply math to accumulated damage, regardless of valid_damage flag
# (accumulated damage is already filtered by brittle_flag at damage time)
execute \
    if score @s im_brittleValidDamage = const 1 \
    run function imperium:enchantments/brittle_math

#say brittle_filter
