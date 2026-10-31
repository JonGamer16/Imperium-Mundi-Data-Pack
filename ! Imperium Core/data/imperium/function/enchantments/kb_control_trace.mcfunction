# Debug (/function imperium:test/toggle_kb_trace), mob victims only: compare the knockback vanilla
# actually gave with what kb_control_rebuild would rebuild for a player in the same spot.
# The rebuild needs the pre-hit velocity, which a mob no longer has, so it assumes the mob was
# standing still (0, -0.0784, 0): test on a still NoAI husk.
scoreboard players operation #kbTx im.temp = #kbX im.temp
scoreboard players operation #kbTy im.temp = #kbY im.temp
scoreboard players operation #kbTz im.temp = #kbZ im.temp
scoreboard players set #kbX im.temp 0
scoreboard players set #kbY im.temp -784
scoreboard players set #kbZ im.temp 0
function imperium:enchantments/kb_control_rebuild
tellraw @a [{text:"[kb] vanilla ",color:"gold"},{score:{name:"#kbTx",objective:"im.temp"},color:"white"},{text:" "},{score:{name:"#kbTy",objective:"im.temp"},color:"white"},{text:" "},{score:{name:"#kbTz",objective:"im.temp"},color:"white"},{text:"  rebuilt ",color:"gold"},{score:{name:"#kbKx",objective:"im.temp"},color:"aqua"},{text:" "},{score:{name:"#kbKy",objective:"im.temp"},color:"aqua"},{text:" "},{score:{name:"#kbKz",objective:"im.temp"},color:"aqua"},{text:"  extra x100 ",color:"gray"},{score:{name:"#kbE",objective:"im.temp"},color:"gray"}]
scoreboard players operation #kbX im.temp = #kbTx im.temp
scoreboard players operation #kbY im.temp = #kbTy im.temp
scoreboard players operation #kbZ im.temp = #kbTz im.temp
