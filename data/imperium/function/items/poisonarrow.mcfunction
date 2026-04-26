clear @a[scores={rPoisonArrow=1,itemreload=300..}] tipped_arrow 1
clear @a[scores={rPoisonArrow=2,itemreload=300..}] tipped_arrow 2
clear @a[scores={rPoisonArrow=3,itemreload=300..}] tipped_arrow 3
clear @a[scores={rPoisonArrow=4,itemreload=300..}] tipped_arrow 4
clear @a[scores={rPoisonArrow=5,itemreload=300..}] tipped_arrow 5
clear @a[scores={rPoisonArrow=6,itemreload=300..}] tipped_arrow 6

give @a[scores={rPoisonArrow=1,itemreload=300..}] tipped_arrow[potion_contents={potion:"poison"}] 1
give @a[scores={rPoisonArrow=2,itemreload=300..}] tipped_arrow[potion_contents={potion:"poison"}] 2
give @a[scores={rPoisonArrow=3,itemreload=300..}] tipped_arrow[potion_contents={potion:"poison"}] 3
give @a[scores={rPoisonArrow=4,itemreload=300..}] tipped_arrow[potion_contents={potion:"poison"}] 4
give @a[scores={rPoisonArrow=5,itemreload=300..}] tipped_arrow[potion_contents={potion:"poison"}] 5
give @a[scores={rPoisonArrow=6,itemreload=300..}] tipped_arrow[potion_contents={potion:"poison"}] 6

scoreboard players remove @a[scores={rPoisonArrow=1..,itemreload=300..}] itemreload 300