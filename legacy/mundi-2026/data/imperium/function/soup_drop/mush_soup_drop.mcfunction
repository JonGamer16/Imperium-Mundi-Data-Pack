execute at @e[type=item,nbt={Item:{id:"minecraft:mushroom_stew"}}] run effect give @p instant_health 1 1

execute at @e[type=item,nbt={Item:{id:"minecraft:mushroom_stew"}}] run playsound entity.generic.eat player @a ~ ~ ~ 1 1

execute at @e[type=item,nbt={Item:{id:"minecraft:mushroom_stew"}}] run kill @e[type=item,nbt={Item:{id:"minecraft:mushroom_stew"}}]
