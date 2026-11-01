execute at @e[type=item,nbt={Item:{id:"minecraft:beetroot_soup"}}] run effect give @p instant_health 1 0

execute at @e[type=item,nbt={Item:{id:"minecraft:beetroot_soup"}}] run playsound entity.generic.eat player @a ~ ~ ~ 1 1

execute at @e[type=item,nbt={Item:{id:"minecraft:beetroot_soup"}}] run kill @e[type=item,nbt={Item:{id:"minecraft:beetroot_soup"}}]
