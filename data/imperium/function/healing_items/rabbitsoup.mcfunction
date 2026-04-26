clear @a[scores={rRabbitSoup=1,onKill=1..}] rabbit_stew
clear @a[scores={rRabbitSoup=1,onKill=1..}] bowl
give @a[scores={rRabbitSoup=1,onKill=1..}] \
    rabbit_stew[\
        food={nutrition:0,saturation:0,can_always_eat:true},\
        consumable={\
            consume_seconds:0,\
            on_consume_effects:[{type:"apply_effects",effects:[\
                {id:"instant_health",amplifier:1,duration:1},\
                {id:"instant_health",amplifier:0,duration:2}]}]},\
        use_remainder={"id":"bowl",count:1}\
    ] 7