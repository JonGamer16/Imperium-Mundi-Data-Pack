clear @a[scores={rTotem=1,itemreload=600..}] totem_of_undying
# TODO Make it an execute that checks if the offhand is empty, and if it isn't, then use /give instead
item replace entity @a[scores={rTotem=1,itemreload=600..}] weapon.offhand with totem_of_undying 1
scoreboard players remove @a[scores={rTotem=1,itemreload=600..}] itemreload 600

scoreboard players set @a[scores={itemreload=..0}] itemreload 0