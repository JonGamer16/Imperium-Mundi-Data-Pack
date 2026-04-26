advancement revoke @s only imperium:tickscheduler/endoftick
# Code you wish to run at the end of the tick.

execute as @s run \
    function imperium:enchantments/lifesteal

# In this example, this code is scheduled by `inventory_changed`
# which normally is scheduled to run first in a tick, before
# other advancements or scores can be updated.

# Credits:
# - Stuffy
# - Evtema3
#
