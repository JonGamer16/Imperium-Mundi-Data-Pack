scoreboard players set @s im.chinks_weapon 0
scoreboard players set @s im.chinks_armor 0

# Scan Slots
execute \
    if items entity @s weapon.mainhand \
    *[minecraft:enchantments~[{enchantments:"imperium:chinks_curse"}]] \
    run function imperium:enchantments/chinks_slot {slot:"SelectedItem", target:"im.chinks_weapon"}
execute \
    if items entity @s armor.head \
    *[minecraft:enchantments~[{enchantments:"imperium:chinks_curse"}]] \
    run function imperium:enchantments/chinks_slot {slot:"equipment.head", target:"im.chinks_armor"}
execute \
    if items entity @s armor.chest \
    *[minecraft:enchantments~[{enchantments:"imperium:chinks_curse"}]] \
    run function imperium:enchantments/chinks_slot {slot:"equipment.chest", target:"im.chinks_armor"}
execute \
    if items entity @s armor.legs \
    *[minecraft:enchantments~[{enchantments:"imperium:chinks_curse"}]] \
    run function imperium:enchantments/chinks_slot {slot:"equipment.legs", target:"im.chinks_armor"}
execute \
    if items entity @s armor.feet \
    *[minecraft:enchantments~[{enchantments:"imperium:chinks_curse"}]] \
    run function imperium:enchantments/chinks_slot {slot:"equipment.feet", target:"im.chinks_armor"}

# Abort if values have not changed since last tick to save resources
execute \
    if score @s im.chinks_weapon = @s im.chinks_weapon_prev \
    if score @s im.chinks_armor = @s im.chinks_armor_prev \
    run return 0
scoreboard players operation @s im.chinks_weapon_prev = @s im.chinks_weapon
scoreboard players operation @s im.chinks_armor_prev = @s im.chinks_armor

# Store converted floats for the modifier macro
execute \
    store result storage imperium:macro weapon double -0.001 \
    run scoreboard players get @s im.chinks_weapon
execute \
    store result storage imperium:macro armor double -0.00025 \
    run scoreboard players get @s im.chinks_armor

function imperium:enchantments/chinks_apply with storage imperium:macro