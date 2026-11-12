# Runs as the victim (affected: "victim"). Deal 6 bonus damage, credited to whoever just hit it.
# The attacker's cooldown gate (im_offhandCd == 0) lives in the enchantment JSON "requirements",
# so if this function runs at all, the attacker is already off cooldown. Do NOT set the timer
# here: this runs as the victim, so it would stamp the wrong entity. offhand_cd sets it on the
# attacker, and core/tick counts it down.
tag @s add im.offhand_victim
execute on attacker run damage @e[tag=im.offhand_victim,limit=1] 6 imperium:light by @s
tag @s remove im.offhand_victim
