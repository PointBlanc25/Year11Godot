extends Node2D
var spawn_points
const BOX_PICKUP = preload("res://Scenes/Box Pickup.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_points = get_children()
	spawn_points.erase($Timer)
	


#Starts spawning the wood as soon as you start the game
func _process(delta):
	if PlayerResources.wood >= 50:
		$Timer.start()
		set_process(false)

#It spawns the crate when the timer runs out
func _on_timer_timeout():
	spawn()
	
	#It spawns the new crate at the marker, but its a random marker
func spawn():
	var new_crate = BOX_PICKUP.instantiate()
	new_crate.global_position = spawn_points.pick_random().global_position
	owner.add_child(new_crate)
