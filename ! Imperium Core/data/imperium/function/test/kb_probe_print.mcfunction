# Prints @s's velocity (Motion, blocks/tick x1000) to chat.
execute store result score #kx im.temp run data get entity @s Motion[0] 1000
execute store result score #ky im.temp run data get entity @s Motion[1] 1000
execute store result score #kz im.temp run data get entity @s Motion[2] 1000
$tellraw @a [{"text":"[kb] $(label) ","color":"gold"},{"selector":"@s","color":"gray"},{"text":"  x=","color":"gray"},{"score":{"name":"#kx","objective":"im.temp"}},{"text":"  y=","color":"gray"},{"score":{"name":"#ky","objective":"im.temp"}},{"text":"  z=","color":"gray"},{"score":{"name":"#kz","objective":"im.temp"}}]
