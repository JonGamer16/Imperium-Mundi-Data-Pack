# Runs as the attacker, with the held weapon's imperium_kb compound as macro arguments.
$scoreboard players set #kbH im.temp $(horizontal)
$scoreboard players set #kbV im.temp $(vertical)
execute as @e[tag=im.kb_victim,limit=1] run function imperium:enchantments/kb_control_apply
