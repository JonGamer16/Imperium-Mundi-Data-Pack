clear @s shield[\
        base_color="black",\
        banner_patterns=[\
            {pattern:"gradient",color:"white"},\
            {pattern:"gradient_up",color:"light_gray"},\
            {pattern:"straight_cross",color:"gray"},\
            {pattern:"border",color:"gray"},\
            {pattern:"rhombus",color:"gray"}]] 1

#   If there is something in offhand just give it
execute \
    if entity @s[nbt={Inventory:[{Slot:-106b}]}] \
    run give @s shield[\
        damage=321,\
        base_color="black",\
        banner_patterns=[\
            {pattern:"gradient",color:"white"},\
            {pattern:"gradient_up",color:"light_gray"},\
            {pattern:"straight_cross",color:"gray"},\
            {pattern:"border",color:"gray"},\
            {pattern:"rhombus",color:"gray"}]]

#   This comes 2nd to avoid giving 2 shields because otherwise
#   the above command sees the shield and gives another
execute \
    unless entity @s[nbt={Inventory:[{Slot:-106b}]}] \
    run item replace entity @s weapon.offhand with shield[\
        damage=321,\
        base_color="black",\
        banner_patterns=[\
            {pattern:"gradient",color:"white"},\
            {pattern:"gradient_up",color:"light_gray"},\
            {pattern:"straight_cross",color:"gray"},\
            {pattern:"border",color:"gray"},\
            {pattern:"rhombus",color:"gray"}]]

scoreboard players remove @s itemreload 300