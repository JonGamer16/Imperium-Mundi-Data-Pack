# 1. Reset temporary math score
scoreboard players set @s im_brittleArmorDura 0

# 2. Try to get the item's existing damage
# (If the item is pristine and has 0 damage, this fails and im_tempDamage remains 0)
execute \
    store result score @s im_brittleArmorDura \
    run data get \
        entity @e[type=chest_minecart,tag=im_brittle_cart,sort=nearest,limit=1] \
        Items[{Slot:0b}].components."minecraft:damage"

# 3. Add the Brittle damage to the current damage
scoreboard players operation @s im_brittleArmorDura += @s im_brittleDura

# 4. Store the new total damage directly back into the item's NBT
execute \
    store result \
        entity @e[type=chest_minecart,tag=im_brittle_cart,sort=nearest,limit=1] \
        Items[{Slot:0b}].components."minecraft:damage" int 1 \
    run scoreboard players get @s im_brittleArmorDura

#say brittle_apply