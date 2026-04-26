execute at @e[type=item,nbt={Item:{id:"minecraft:cake"}}] run effect give @p instant_health 1 4

execute at @e[type=item,nbt={Item:{id:"minecraft:cake"}}] run playsound entity.generic.eat player @a ~ ~ ~ 1 1

execute at @e[type=item,nbt={Item:{id:"minecraft:cake"}}] run kill @e[type=item,nbt={Item:{id:"minecraft:cake"}}]