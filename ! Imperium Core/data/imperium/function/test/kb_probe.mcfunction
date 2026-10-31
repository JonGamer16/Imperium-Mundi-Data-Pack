# TEMPORARY probe for the knockback-scaler idea (remove once answered).
# Runs as the victim from the kb_probe enchantment's post_attack. Question: has vanilla already
# applied this hit's knockback when post_attack runs? Hit a victim that is standing still:
#   post_attack shows a large x/z  -> knockback was applied first (the scaler idea works)
#   post_attack shows ~0, next tick shows a large x/z -> post_attack runs first (it doesn't)
function imperium:test/kb_probe_print {label:"post_attack"}
execute on attacker run function imperium:test/kb_probe_print {label:"attacker   "}
tag @s add im.kbprobe
schedule function imperium:test/kb_probe_next 1t
