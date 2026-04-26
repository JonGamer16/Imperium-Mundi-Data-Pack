clear @a[scores={rGapple=1,onKill=1..}] golden_apple
give @a[scores={rGapple=1,onKill=1..}] \
    golden_apple[\
        max_stack_size=1,\
        food={nutrition:0,saturation:0,can_always_eat:true},\
        consumable={\
            consume_seconds:0.8,\
            on_consume_effects:[{type:"apply_effects",effects:[\
                    {id:"instant_health",amplifier:0,duration:1},\
                    {id:"regeneration",amplifier:1,duration:121},\
                    {id:"absorption",amplifier:1,duration:600}\
    ]}]}] 8