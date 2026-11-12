attribute @s attack_damage modifier remove imperium:chinks_weapon
$execute if score @s im_chinksWeapon matches 1.. run attribute @s attack_damage modifier add imperium:chinks_weapon $(weapon) add_multiplied_total
attribute @s armor modifier remove imperium:chinks_armor
$execute if score @s im_chinksArmor matches 1.. run attribute @s armor modifier add imperium:chinks_armor $(armor) add_multiplied_total
