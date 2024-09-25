extends CharacterBody2D

func _process(delta):
	translate(Vector2(1,0.3)* delta * 20 )

#When the pickup is in the raft it changes the progress bar
func _on_area_2d_body_entered(body):
	if body.is_in_group("Raft"):  # Assuming the player is in a group named "Player"
		queue_free()
		PlayerResources.wood +=2
