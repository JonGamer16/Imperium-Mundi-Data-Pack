execute at @e[type=item,nbt={Item:{id:"minecraft:rabbit_stew"}}] run effect give @p instant_health 3 0

execute at @e[type=item,nbt={Item:{id:"minecraft:rabbit_stew"}}] run playsound entity.generic.eat player @a ~ ~ ~ 1 1

execute at @e[type=item,nbt={Item:{id:"minecraft:rabbit_stew"}}] run kill @e[type=item,nbt={Item:{id:"minecraft:rabbit_stew"}}]
