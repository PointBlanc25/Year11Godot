extends CanvasLayer

@onready var health = $Control/Health
@onready var experience = $Control/Experience
@export var level_up_notice: PanelContainer 

#It makes you level up
func _ready():
	PlayerStats.level_up.connect(level_up)
	PlayerStats.take_damage.connect(update_health)
	PlayerStats.add_xp.connect(update_xp)
	print(level_up_notice)
	
#When you level up the notice comes up
func level_up():
	update_xp()
	level_up_notice.visible = true

#It shows your the experience bar that resets every time you level up
func update_xp():
	experience.max_value = PlayerStats.next_level
	experience.value = PlayerStats.player_experience

#What happens when you upgrade your health
func update_health():
	health.max_value = PlayerStats.player_max_health
	health.value = PlayerStats.player_health

#What happens when the upgrades have been done
func _on_level_up_notice_visibility_changed():
	print(level_up_notice)
	if level_up_notice.visible == true:
		get_tree().paused = true
	else:
		get_tree().paused = false

#What happens when you upgrade health
func _on_btn_health_level_pressed():
	PlayerStats.add_max_health()
	level_up_notice.visible = false

#Upgrading Arrow
func _on_btn_knife_level_pressed():
	WeaponArrow.level_up_arrow()
	level_up_notice.visible = false
