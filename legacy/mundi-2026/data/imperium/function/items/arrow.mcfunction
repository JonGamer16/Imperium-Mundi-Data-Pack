clear @a[scores={rArrow=1,itemreload=300..}] arrow 1
clear @a[scores={rArrow=2,itemreload=300..}] arrow 2
clear @a[scores={rArrow=3,itemreload=300..}] arrow 3
clear @a[scores={rArrow=4,itemreload=300..}] arrow 4
clear @a[scores={rArrow=5,itemreload=300..}] arrow 5
clear @a[scores={rArrow=6,itemreload=300..}] arrow 6

give @a[scores={rArrow=1,itemreload=300..}] arrow 1
give @a[scores={rArrow=2,itemreload=300..}] arrow 2
give @a[scores={rArrow=3,itemreload=300..}] arrow 3
give @a[scores={rArrow=4,itemreload=300..}] arrow 4
give @a[scores={rArrow=5,itemreload=300..}] arrow 5
give @a[scores={rArrow=6,itemreload=300..}] arrow 6

scoreboard players remove @a[scores={rArrow=1..,itemreload=300..}] itemreload 300
