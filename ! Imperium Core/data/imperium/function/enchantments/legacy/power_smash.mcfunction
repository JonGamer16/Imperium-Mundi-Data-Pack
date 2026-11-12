# Power Smash tick effect: sneak to charge. Hits at 40-44 ticks deal double (see the enchantment).
execute unless predicate imperium:legacy/sneaking run return run scoreboard players reset @s im_powersmash
scoreboard players add @s im_powersmash 1

execute if score @s im_powersmash matches 1.. run title @s times 0 20 0
execute if score @s im_powersmash matches 1..9 run title @s subtitle [{text:"● ",underlined:true,color:"dark_blue"},{text:"● ",underlined:true,color:"dark_blue"},{text:"● ",underlined:true,color:"dark_blue"},{text:"⬤",underlined:true,color:"dark_blue"}]
execute if score @s im_powersmash matches 10..19 run title @s subtitle [{text:"● ",underlined:true,color:"green"},{text:"● ",underlined:true,color:"dark_blue"},{text:"● ",underlined:true,color:"dark_blue"},{text:"⬤",underlined:true,color:"dark_blue"}]
execute if score @s im_powersmash matches 20..29 run title @s subtitle [{text:"● ",underlined:true,color:"green"},{text:"● ",underlined:true,color:"yellow"},{text:"● ",underlined:true,color:"dark_blue"},{text:"⬤",underlined:true,color:"dark_blue"}]
execute if score @s im_powersmash matches 30..39 run title @s subtitle [{text:"● ",underlined:true,color:"green"},{text:"● ",underlined:true,color:"yellow"},{text:"● ",underlined:true,color:"gold"},{text:"⬤",underlined:true,color:"dark_blue"}]
execute if score @s im_powersmash matches 40..49 run title @s subtitle [{text:"● ",underlined:true,color:"green"},{text:"● ",underlined:true,color:"yellow"},{text:"● ",underlined:true,color:"gold"},{text:"✪",underlined:true,color:"red"}]
execute if score @s im_powersmash matches 1..49 run title @s title {text:""}

execute if score @s im_powersmash matches 10 run playsound block.note_block.chime player @s ~ ~ ~ 1 0.595
execute if score @s im_powersmash matches 20 run playsound block.note_block.chime player @s ~ ~ ~ 1 0.595
execute if score @s im_powersmash matches 30 run playsound block.note_block.chime player @s ~ ~ ~ 1 0.595
execute if score @s im_powersmash matches 40 run playsound block.note_block.chime player @s ~ ~ ~ 1 1.189
execute if score @s im_powersmash matches 40 run playsound block.note_block.bell player @s ~ ~ ~ 1 0.595
