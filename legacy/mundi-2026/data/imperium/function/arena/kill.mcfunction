scoreboard players set @e[type=#imperium:human,scores={killFlag=1..,killDamage=200..}] onKill 1
scoreboard players set @e[type=#imperium:human,scores={killFlag=1..,killDamage=..199}] killFlag 0

function imperium:items/trident
function imperium:items/goldarmor

function imperium:healing_items/beetsoup
function imperium:healing_items/mushsoup
function imperium:healing_items/rabbitsoup
function imperium:healing_items/craftsoup
function imperium:healing_items/healthpot
function imperium:healing_items/gapple
function imperium:healing_items/regenpot
function imperium:healing_items/cake

scoreboard players set @e[type=#imperium:human,scores={onKill=1}] killDamage 0
scoreboard players set @e[type=#imperium:human,scores={onKill=1}] killFlag 0
scoreboard players set @e[type=#imperium:human,scores={onKill=1}] onKill 0
