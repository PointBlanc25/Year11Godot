extends CharacterBody2D

@export var speed = 21
@onready var raft = get_tree().get_first_node_in_group("Raft")  # Adjust this path if necessary
@export var health = 100
@onready var damage_timer: Timer = $Hurtbox/Timer
@export var damage = 5
@onready var sprite: AnimatedSprite2D = $Sprite
const BLOOD = preload("res://Scenes/blood.tscn")
const EXPERIENCE = preload("res://Scenes/Experience.tscn")


#Shark doing damage to the character
func check_collisions():
	if not damage_timer.is_stopped():
		return
	var collisions = $Hurtbox.get_overlapping_bodies()
	if collisions:
		for collision in collisions:
			if collision.is_in_group("Raft") and damage_timer.is_stopped():
				PlayerStats.damage_player(damage)
				$AudioStreamPlayer2D.play()
				damage_timer.start()

#Path Finds For the Character + Raft
func _physics_process(delta):
	if raft:
		var direction = (raft.position - position).normalized()
		velocity = direction * speed
		
		if velocity.x > 0:
			sprite.flip_h = true
		else:
			sprite.flip_h = false
		
		check_collisions()
		move_and_slide()
		
		#What happens when the sharks take damage
func take_damage(dmg):
	health -= dmg
	$DamageNoise.play()
	var new_blood = BLOOD.instantiate()
	new_blood.global_position = global_position
	add_sibling(new_blood)
	if health <= 0:
		new_blood.global_position = global_position
		add_sibling(new_blood)
	
	#It drops a gem every time you kill the shark
		var new_gem = EXPERIENCE.instantiate()
		$DamageNoise.play()
		new_gem.global_position = global_position
		add_sibling(new_gem)
		queue_free()
	
