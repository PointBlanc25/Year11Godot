extends Sprite2D



func _on_restart_pressed():
	play_game()

func _on_quit_pressed():
	get_tree().quit()
