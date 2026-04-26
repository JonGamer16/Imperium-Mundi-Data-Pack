clear @a[scores={rTrident2=1,itemreload=300..}] trident[unbreakable={},enchantments={"sharpness":1},damage=245]
#TODO Make it so it replaces if offhand is empty, or gives it if it's not
item replace entity @a[scores={rTrident2=1,itemreload=300..}] weapon.offhand with trident[unbreakable={},enchantments={"sharpness":1},damage=245] 1
scoreboard players remove @a[scores={rTrident2=1,itemreload=300..}] itemreload 300

scoreboard players set @a[scores={itemreload=..0}] itemreload 0