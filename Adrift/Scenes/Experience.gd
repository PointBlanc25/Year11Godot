extends Area2D

@export var experience_value = 5
var collected = false
@onready var player = get_tree().get_first_node_in_group("Raft")

#The Experience Moves Towards the Raft's pickup zone
func _process(delta):
	if collected:
		if player:
			global_position = global_position.move_toward(player.global_position, 300 * delta)
			
#When it touches the raft, it runs a function to collect and adds value to your experience bar
func collect():
	$AudioStreamPlayer2D.play()
	collected = true
	PlayerStats.add_experience(experience_value)
	
	

#When it touches the raft it queue frees it
func _on_body_entered(body):
	if body.is_in_group("Raft"):
		queue_free()
