extends Node2D
var spawn_points
const PICKUP = preload("res://Scenes/Pickup.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_points = get_children()
	spawn_points.erase($Timer)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#When the timer runs out it will spawn the log
func _on_timer_timeout():
	spawn()
	
	#Spawns the new stick at the marker at a random marker though
func spawn():
	var new_stick = PICKUP.instantiate()
	new_stick.global_position = spawn_points.pick_random().global_position
	owner.add_child(new_stick)
