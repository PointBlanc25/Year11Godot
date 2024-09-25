extends CharacterBody2D

@export var SPEED = 100.0
@export var ACCELERATION = 50
@export var FRICTION = 10.0

#This moves the raft up, down, left, right in the world
func _physics_process(delta):
	# Process physics-related updates every frame
	# Get the directional input and normalize it
	var direction = Input.get_vector("left","right","up","down").normalized()
	if direction:
		velocity = velocity.move_toward(direction * SPEED, ACCELERATION)
	else:
		# Gradually reduce velocity towards zero using friction
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)


	move_and_slide()
	
	
	check_upgrades()
	

func check_upgrades():
	# Check for upgrade conditions based on player resources
	if PlayerResources.wood == 50:
		#PlayerResources.wood = 0
		$AudioStreamPlayer2D.play
		$StarterRaftTile.hide()
		$Upgrade1Tile.show()
		$Upgrade1.disabled = false
		
	#What happens when the crates are up to 75
	if PlayerResources.crates == 75:
		$AudioStreamPlayer2D.play
		#PlayerResources.crates = 0
		$Upgrade1Tile.hide()
		$Upgrade2Tile.show()
		$Upgrade2.disabled = false

#What happens when the pickup is in the pickup zone
func _on_pickup_zone_area_entered(area):
	if area.is_in_group("Pickup"):
		if area.has_method("collect"):
			area.collect()

#When you click quit
func _on_escape_pressed():
	get_tree().quit()
