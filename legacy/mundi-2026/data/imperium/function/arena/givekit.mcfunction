execute as @s[scores={givekit=1..}] run attribute @s knockback_resistance base set 0.44
execute as @s[scores={givekit=1..}] run attribute @s attack_knockback base set 1

execute as @s[scores={givekit=11}] run function imperium:kits_focused/shieldsman
execute as @s[scores={givekit=12}] run function imperium:kits/viking
#execute as @s[scores={givekit=13}] run function imperium:kits/knight
#execute as @s[scores={givekit=14}] run function imperium:kits/miner
execute as @s[scores={givekit=15}] run function imperium:kits/monarch
execute as @s[scores={givekit=16}] run function imperium:kits/fencer

execute as @s[scores={givekit=21}] run function imperium:kits_focused/gunner
#execute as @s[scores={givekit=22}] run function imperium:kits/huntsman
#execute as @s[scores={givekit=23}] run function imperium:kits/sniper
#execute as @s[scores={givekit=24}] run function imperium:kits/shulker
#execute as @s[scores={givekit=25}] run function imperium:kits/raider
#execute as @s[scores={givekit=26}] run function imperium:kits/wisp

execute as @s[scores={givekit=31}] run function imperium:kits/amazon
#execute as @s[scores={givekit=32}] run function imperium:kits/specter
#execute as @s[scores={givekit=33}] run function imperium:kits/vampire
#execute as @s[scores={givekit=34}] run function imperium:kits/assassin
#execute as @s[scores={givekit=35}] run function imperium:kits/pawn

execute as @s[scores={givekit=41}] run function imperium:kits/champion
#execute as @s[scores={givekit=42}] run function imperium:kits/cactus
execute as @s[scores={givekit=43}] run function imperium:kits/paladin
execute as @s[scores={givekit=44}] run function imperium:kits_focused/zombie
#execute as @s[scores={givekit=45}] run function imperium:kits/golem
#execute as @s[scores={givekit=46}] run function imperium:kits/mummy

#execute as @s[scores={givekit=51}] run function imperium:kits/alchemist
#execute as @s[scores={givekit=52}] run function imperium:kits/nomad
#execute as @s[scores={givekit=53}] run function imperium:kits/snowman
  execute as @s[scores={givekit=54}] run function imperium:kits_focused/arcane
#execute as @s[scores={givekit=55}] run function imperium:kits/dryad
execute as @s[scores={givekit=56}] run function imperium:kits/mushroom

execute as @s[scores={givekit=61}] run function imperium:kits/scout
#execute as @s[scores={givekit=62}] run function imperium:kits/falcon
#execute as @s[scores={givekit=63}] run f unction imperium:kits/grappler
#execute as @s[scores={givekit=64}] run function imperium:kits/architect
execute as @s[scores={givekit=65}] run function imperium:kits/scavenger

#execute as @s[scores={givekit=71}] run function imperium:kits/pyromancer
execute as @s[scores={givekit=72}] run function imperium:kits/caster
execute as @s[scores={givekit=73}] run function imperium:kits/revenant
execute as @s[scores={givekit=74}] run function imperium:kits/guardian
#execute as @s[scores={givekit=75}] run function imperium:kits/swarmer
#execute as @s[scores={givekit=76}] run function imperium:kits/reaper

#execute as @s[scores={givekit=111}] run function imperium:kits/crusader
#execute as @s[scores={givekit=114}] run function imperium:kits/dwarf
#execute as @s[scores={givekit=116}] run function imperium:kits/scrapper
#execute as @s[scores={givekit=121}] run function imperium:kits/colonel
execute as @s[scores={givekit=141}] run function imperium:kits_focused/samurai
#execute as @s[scores={givekit=153}] run function imperium:kits/frostmage
#execute as @s[scores={givekit=161}] run function imperium:kits/stray
#execute as @s[scores={givekit=173}] run function imperium:kits/moonfox

scoreboard players operation @s im_lastKit = @s givekit
execute as @s[scores={givekit=1..}] run scoreboard players reset @s givekit

# givekit score of 0 is reserved for giving the last kit the player used.
# if player has a stored lastKit greater than 0, set givekit equal to lastKit and rerun.
# it shouldn't run again because lastKit and givekit are now equal and therefore false.
# 0 should be different from having a null reset score. if it's bugged, make it use 1000.
execute as @s[scores={givekit=0}] \
  if score @s im_lastKit > @s givekit \
  run function imperium:arena/lastkit
