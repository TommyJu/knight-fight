extends Area2D
#@onready var player_1: CharacterBody2D = %Player1
#@onready var player_2: CharacterBody2D = %Player2
@onready var player_1 = get_node("/root/Game/Players/Player1")
@onready var player_2 = get_node("/root/Game/Players/Player2")
@onready var game_manager = get_node("/root/Game/GameManager")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_body_entered(body: Node2D) -> void:
	if body == player_1:
		game_manager.remove_point_player_1()
		game_manager.add_point_player_2()
	elif body == player_2:
		game_manager.remove_point_player_2()
		game_manager.add_point_player_1()

	
