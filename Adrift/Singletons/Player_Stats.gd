extends Node

var player_level = 1
var player_experience = 0
var player_health = 100
var player_max_health = 100
var next_level = 15
const GAME_OVER = preload("res://Scenes/game_over.tscn")

signal level_up
signal add_xp
signal take_damage

#Once you die it resets everything 
func restart_game():
	player_level = 1
	player_experience = 0
	player_health = 100
	player_max_health = 100
	next_level = 15
	PlayerResources.reset_resources()
	WeaponArrow.reset_arrow()
	
	#This upgrades the Level when you level up and makes you require for more gems
func level_up_player():
	player_level+=1
	next_level = next_level + 10
	player_experience = 0
	emit_signal("level_up")

#Adds experience once you finish getting the experience
func add_experience(val):
	player_experience += val
	emit_signal("add_xp")
	if player_experience >= next_level:
		level_up_player()
		
		#How much health you get taken off when you get hit
func damage_player(amount):
	player_health -= amount
	emit_signal("take_damage")
	if player_health <= 0:
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
	
	#Adds your max health once you upgrade your health
func add_max_health():
	player_max_health += 20
	player_health = player_max_health
	emit_signal("take_damage")
