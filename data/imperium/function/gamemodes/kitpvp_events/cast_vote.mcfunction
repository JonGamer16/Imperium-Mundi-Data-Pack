scoreboard players set @s im_has_voted 1
scoreboard players add #EVENT im_event_votes 1
tellraw @a [{"text":"[Event] ","color":"gold"},{"selector":"@s"},{"text":" voted to start!","color":"gray"}]