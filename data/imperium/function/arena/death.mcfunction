#clear @e[type=#imperium:human,scores={onDeath=1..}]

# Healing Items
scoreboard players reset @s rBeetSoup
scoreboard players reset @s rCake
scoreboard players reset @s rCraftSoup
scoreboard players reset @s rGapple
scoreboard players reset @s rHeal2Pot
scoreboard players reset @s rMushSoup
scoreboard players reset @s rRabbitSoup
scoreboard players reset @s rRegenPot
scoreboard players reset @s rSlowPot

# Item Reload
scoreboard players set @s itemreload 0

# Kit Items
scoreboard players reset @s rArrow
scoreboard players reset @s rBlazePowder
scoreboard players reset @s rGravityArrow
scoreboard players reset @s rShield
scoreboard players reset @s rGoldArmor
scoreboard players reset @s rHarmPot
scoreboard players reset @s rJumpPot
scoreboard players reset @s rPearl
scoreboard players reset @s rTotem
scoreboard players reset @s rTrident
scoreboard players reset @s rTrident2
scoreboard players reset @s rWindCharge

# Summon Items
scoreboard players reset @s rBlazeEgg
scoreboard players reset @s rWolfEgg
scoreboard players reset @s rZombieEgg

# Teams
execute as @s run team leave zombie
execute as @s run team leave blaze

scoreboard players set @s onDeath 0

# Game Records
execute as @s \
    if score @s damageThisLife > @s damageRecord \
    run scoreboard players operation @s damageRecord = @s damageThisLife
scoreboard players reset @s damageThisLife