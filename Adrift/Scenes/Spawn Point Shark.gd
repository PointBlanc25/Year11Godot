extends Node2D
var spawn_points
const SHARK = preload("res://Scenes/Enemy Shark.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_points = get_children()
	spawn_points.erase($Timer)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#when the timer runs out spawn a shark
func _on_timer_timeout():
	spawn()

#create a new shark and put it on a random spawn point
func spawn():
	var new_shark = SHARK.instantiate()
	new_shark.global_position = spawn_points.pick_random().global_position
	owner.add_child(new_shark)
