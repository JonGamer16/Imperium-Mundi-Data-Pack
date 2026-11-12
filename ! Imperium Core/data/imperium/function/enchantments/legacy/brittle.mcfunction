# Curse of Embrittlement tick effect (runs once per cursed piece worn). Armor doesn't wear normally
# (item_damage x0); it loses 1 durability per HP actually taken from armor-respecting damage.
# im_brittleTaken is the damage_taken stat in 1/10 HP. It doesn't exist until first changed.
scoreboard players add @s im_brittleTaken 0
execute if score @s im_brittleHit matches 1 run function imperium:enchantments/legacy/brittle_hit
scoreboard players operation @s im_brittlePrev = @s im_brittleTaken
