extends Area2D

var speed = 750

#Aims at The Arrow At The Mouse Position
func _ready():
	look_at(get_global_mouse_position())

#Arrow Speed and Moving Constantly
func _physics_process(delta):
	position += transform.x * WeaponArrow.arrow_speed * delta

#Arrow Damage In The Shark
func _on_body_entered(body):
	if body.is_in_group("Shark") and body.has_method("take_damage"):
		body.take_damage(WeaponArrow.arrow_damage)
		queue_free()
