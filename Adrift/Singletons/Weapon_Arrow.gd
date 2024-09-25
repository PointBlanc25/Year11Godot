extends Node

#Starting Level Arrow
var arrow_level = 1
var arrow_damage = 20
var arrow_speed = 300
var arrow_projectiles = 1
var arrow_time = 0.5
var arrow_knockback = 10
var knife_max_level = 5

#This resets the arrow back when the character dies so you don't keep your progress
func reset_arrow():
	arrow_level = 1
	arrow_damage = 20
	arrow_speed = 300
	arrow_projectiles = 1
	arrow_time = 0.5
	arrow_knockback = 10
	knife_max_level = 5
	
	#This upgrades the arrow once the person clicks upgrade arrow on the upgrade panel
func level_up_arrow():
	arrow_level +=1
	match arrow_level:
		1:
			pass
		2:
			arrow_damage = 25
			arrow_speed = 400
			arrow_projectiles = 1
			arrow_time = 0.4
			arrow_knockback = 10
		3:
			arrow_damage = 40
			arrow_speed = 500
			arrow_projectiles = 1
			arrow_time = 0.3
			arrow_knockback = 20
		4:
			arrow_damage = 50
			arrow_speed = 650
			arrow_projectiles = 2
			arrow_time = 0.3
			arrow_knockback = 20
		5: 
			arrow_damage = 100
			arrow_speed = 700
			arrow_projectiles = 2
			arrow_time = false
			arrow_knockback = 25
