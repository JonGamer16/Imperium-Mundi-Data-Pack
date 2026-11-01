recipe take @s imperium:craftsoup
advancement revoke @s only imperium:craftsoup_adv
clear @s knowledge_book
give @s \
    mushroom_stew[\
        food={nutrition:0,saturation:0,can_always_eat:true},\
        consumable={\
            consume_seconds:0,\
            on_consume_effects:[{type:"apply_effects",effects:[\
                {id:"instant_health",amplifier:1,duration:1}]}]},\
        use_remainder={"id":"bowl",count:1}\
    ] 1