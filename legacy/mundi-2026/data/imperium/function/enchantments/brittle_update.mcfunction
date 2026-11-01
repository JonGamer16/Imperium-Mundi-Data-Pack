# 1. Summon the temporary minecart
execute \
    at @s \
    run summon chest_minecart ~ ~ ~ {Tags:["im_brittle_cart"]}

# --- HEAD ---
execute \
    at @s \
    run item replace \
        entity @n[type=chest_minecart,tag=im_brittle_cart] container.0 \
        from entity @s armor.head
execute \
    at @s \
    if data \
        entity @n[type=chest_minecart,tag=im_brittle_cart] \
        Items[{Slot:0b}].components."minecraft:enchantments"."imperium:brittle_curse" \
    run function imperium:enchantments/brittle_apply
execute \
    at @s \
    run item replace \
        entity @s armor.head \
        from entity @n[type=chest_minecart,tag=im_brittle_cart] container.0

# --- CHEST ---
execute \
    at @s \
    run item replace \
        entity @n[type=chest_minecart,tag=im_brittle_cart] container.0 \
        from entity @s armor.chest
execute \
    at @s \
    if data \
        entity @n[type=chest_minecart,tag=im_brittle_cart] \
        Items[{Slot:0b}].components."minecraft:enchantments"."imperium:brittle_curse" \
    run function imperium:enchantments/brittle_apply
execute \
    at @s \
    run item replace \
        entity @s armor.chest \
        from entity @n[type=chest_minecart,tag=im_brittle_cart] container.0

# --- LEGS ---
execute \
    at @s \
    run item replace \
        entity @n[type=chest_minecart,tag=im_brittle_cart] container.0 \
        from entity @s armor.legs
execute \
    at @s \
    if data \
        entity @n[type=chest_minecart,tag=im_brittle_cart] \
        Items[{Slot:0b}].components."minecraft:enchantments"."imperium:brittle_curse" \
    run function imperium:enchantments/brittle_apply
execute \
    at @s \
    run item replace \
        entity @s armor.legs \
        from entity @n[type=chest_minecart,tag=im_brittle_cart] container.0

# --- FEET ---
execute \
    at @s \
    run item replace \
        entity @n[type=chest_minecart,tag=im_brittle_cart] container.0 \
        from entity @s armor.feet
execute \
    at @s \
    if data \
        entity @n[type=chest_minecart,tag=im_brittle_cart] \
        Items[{Slot:0b}].components."minecraft:enchantments"."imperium:brittle_curse" \
    run function imperium:enchantments/brittle_apply
execute \
    at @s \
    run item replace \
        entity @s armor.feet \
        from entity @n[type=chest_minecart,tag=im_brittle_cart] container.0

# Clean up
execute \
    at @s \
    run item replace \
        entity @n[type=chest_minecart,tag=im_brittle_cart] container.0 \
        with air

kill @n[type=chest_minecart,tag=im_brittle_cart]

scoreboard players set @s im_brittleArmorDura 0

#say brittle_update