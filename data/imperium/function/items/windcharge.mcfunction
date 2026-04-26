clear @a[scores={rWindCharge=1..,itemreload=300..}] wind_charge
give @a[scores={rWindCharge=4,itemreload=300..}] wind_charge 4
give @a[scores={rWindCharge=8,itemreload=300..}] wind_charge 8
give @a[scores={rWindCharge=12,itemreload=300..}] wind_charge 12
scoreboard players remove @a[scores={rWindCharge=1..,itemreload=300..}] itemreload 300

scoreboard players set @a[scores={itemreload=..0}] itemreload 0