# /function imperium:test/toggle_kb_trace -> on mob hits with a Knockback Control weapon, print the
# knockback vanilla gave next to the player-victim rebuild (kb_control_trace). Survives /reload.
execute store success score #KbTrace im.temp unless score #KbTrace im.temp matches 1
execute if score #KbTrace im.temp matches 1 run tellraw @s {text:"Knockback trace ON",color:"gold"}
execute if score #KbTrace im.temp matches 0 run tellraw @s {text:"Knockback trace OFF",color:"gray"}
