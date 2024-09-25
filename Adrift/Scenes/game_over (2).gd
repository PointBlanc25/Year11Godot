extends Sprite2D

#When you click restart it puts you back into the Main Menu With Animations
func _on_restart_pressed() -> void:
	PlayerStats.restart_game()
	get_tree().change_scene_to_file("res://Menus/scenes/Menus/MainMenu/MainMenuWithAnimations.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
