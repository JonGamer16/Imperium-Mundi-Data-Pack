clear @a[scores={rCake=1,onKill=1..}] cake
give @a[scores={rCake=1,onKill=1..}] \
    cake[\
        food={nutrition:0,saturation:0,can_always_eat:true},\
        consumable={\
            consume_seconds:0,\
            on_consume_effects:[{type:"apply_effects",effects:[\
                    {id:"instant_health",amplifier:9,duration:1}\
    ]}]}] 5