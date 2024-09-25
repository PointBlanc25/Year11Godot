extends CanvasLayer
@onready var wood_bar = $MarginContainer/VBoxContainer/Wood/ProgressBar
@onready var crate_bar = $MarginContainer/VBoxContainer/Crate/ProgressBar
@onready var wood: HBoxContainer = $MarginContainer/VBoxContainer/Wood
@onready var crate: HBoxContainer = $MarginContainer/VBoxContainer/Crate

#It changes wood bar and crate bar value
func _process(delta):
	wood_bar.value = PlayerResources.wood
	crate_bar.value = PlayerResources.crates
	print(crate_bar.value)
	
	#How much wood is needed for the upgrade to happen and the bar disappears
	if wood_bar.value == 50:
		wood.visible = false
		crate.visible = true
		wood_bar.value = 1000

		
		#How much crates are needed for the upgrade to happen and the bar disappears
	if crate_bar.value == 75:
		crate.visible = false
