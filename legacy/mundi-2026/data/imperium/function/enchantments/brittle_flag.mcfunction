scoreboard players set @s im_brittleValidDamage 1
execute \
    store result score @s im_brittleHealthTemp \
    run data get entity @s Health 10
#say DEBUG: brittle_flag CALLED
advancement revoke @s only imperium:enchantments/combat_hit