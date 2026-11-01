clear @a[scores={rGravityArrow=1,itemreload=300..}] tipped_arrow 1
clear @a[scores={rGravityArrow=2,itemreload=300..}] tipped_arrow 2
clear @a[scores={rGravityArrow=3,itemreload=300..}] tipped_arrow 3
clear @a[scores={rGravityArrow=4,itemreload=300..}] tipped_arrow 4

give @a[scores={rGravityArrow=1,itemreload=300..}] tipped_arrow[potion_contents={custom_color:6684927,custom_effects:[{id:"levitation",amplifier:0,duration:100}]}] 1
give @a[scores={rGravityArrow=2,itemreload=300..}] tipped_arrow[potion_contents={custom_color:6684927,custom_effects:[{id:"levitation",amplifier:0,duration:100}]}] 2
give @a[scores={rGravityArrow=3,itemreload=300..}] tipped_arrow[potion_contents={custom_color:6684927,custom_effects:[{id:"levitation",amplifier:0,duration:100}]}] 3
give @a[scores={rGravityArrow=4,itemreload=300..}] tipped_arrow[potion_contents={custom_color:6684927,custom_effects:[{id:"levitation",amplifier:0,duration:100}]}] 4

scoreboard players remove @a[scores={rGravityArrow=1..,itemreload=300..}] itemreload 300