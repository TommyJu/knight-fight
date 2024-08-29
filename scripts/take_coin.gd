extends Area2D
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
		print("player1 coin taken")
	elif body == player_2:
		print("player2 coin taken")

	
