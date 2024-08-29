extends Control

@onready var v_box_container: VBoxContainer = $VBoxContainer
@onready var winner_label: Label = $VBoxContainer/WinnerLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	winner_label.text = RoundCount.determine_winner()
	RoundCount.reset_round()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_again_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	
	
func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

	
func _on_quit_button_pressed() -> void:
	get_tree().quit()
