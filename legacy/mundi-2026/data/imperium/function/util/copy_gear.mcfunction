# copy_gear.mcfunction - Execute as a humanoid mob to copy gear from a nearby armor stand

# Copy Armor Slots
item replace \
    entity @s armor.head \
    from entity @e[type=armor_stand,distance=..3,sort=nearest,limit=1] armor.head
item replace \
    entity @s armor.chest \
    from entity @e[type=armor_stand,distance=..3,sort=nearest,limit=1] armor.chest
item replace \
    entity @s armor.legs \
    from entity @e[type=armor_stand,distance=..3,sort=nearest,limit=1] armor.legs
item replace \
    entity @s armor.feet \
    from entity @e[type=armor_stand,distance=..3,sort=nearest,limit=1] armor.feet

# Copy Weapon Slots
item replace \
    entity @s weapon.mainhand \
    from entity @e[type=armor_stand,distance=..3,sort=nearest,limit=1] weapon.mainhand
item replace \
    entity @s weapon.offhand \
    from entity @e[type=armor_stand,distance=..3,sort=nearest,limit=1] weapon.offhand