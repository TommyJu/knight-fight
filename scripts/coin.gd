extends Area2D
# Prevents having to access a path that is higher in the hierarchy
# Using a unique ID only works for nodes that are on the same scene
@onready var game_manager: Node = %GameManager
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var player_1: CharacterBody2D = %Player1
@onready var player_2: CharacterBody2D = %Player2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body == player_1:
		game_manager.add_point_player_1()
	else:
		game_manager.add_point_player_2()
	animation_player.play("pickup")
