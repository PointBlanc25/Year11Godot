extends AnimatedSprite2D



#What happens once the animation of blood finishes
func _on_animation_finished():
	queue_free()
