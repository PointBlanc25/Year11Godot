extends Node2D

@export var Bullet : PackedScene
var can_shoot = true
var shoot_timer = 0.8

#Crossbow looks at the mouse poistion
func _process(delta: float) -> void:
	look_at(get_global_mouse_position())

#When you click shoot the crossbow also shoots
	if Input.is_action_just_pressed("shoot") and get_parent().visible:
		shoot()
	
	#When you click the shooting button it shoots
func shoot():
	if can_shoot == false : 
		return
	can_shoot = false
	$AudioStreamPlayer2D.play()
	var b = Bullet.instantiate()
	add_sibling(b)
	b.global_position= global_position
	await get_tree().create_timer(shoot_timer).timeout
	can_shoot = true
