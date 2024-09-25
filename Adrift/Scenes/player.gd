extends CharacterBody2D
var can_move = false
@export var SPEED = 100.0
@export var ACCELERATION = 20.0
@export var FRICTION = 10.0
@export var Bullet : PackedScene
var can_shoot = true
var shoot_timer = 0.8

#This moves the character moves up, down, left, right
func _physics_process(delta):
	if can_move:
		var direction = Input.get_vector("left","right","up","down").normalized()
		if direction:
			velocity = velocity.move_toward(direction * SPEED, ACCELERATION)
		else:
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION)

		move_and_slide()
		
	#What happens when you click the action shoot
	if Input.is_action_just_pressed("shoot"):
		shoot()
	
	#When you click the shooting action button it fires
func shoot():
	if can_shoot == false : 
		return
	can_shoot = false
	$AudioStreamPlayer2D.play()
	var b = Bullet.instantiate()
	add_child(b)
	b.global_position= $Muzzle.global_position
	await get_tree().create_timer(shoot_timer).timeout
	can_shoot = true
