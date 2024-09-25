extends CanvasLayer

#What happens when you click the Play button once death
func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/World.tscn")

#Nothing happens when you click Settings
func _on_setting_pressed():
	pass

#What happens when you click quit
func _on_quit_pressed():
	get_tree().quit()
