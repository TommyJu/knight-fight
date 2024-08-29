extends Area2D
#@onready var player_1: CharacterBody2D = %Player1
#@onready var player_2: CharacterBody2D = %Player2
@onready var player_1 = get_node("/root/Game/Players/Player1")
@onready var player_2 = get_node("/root/Game/Players/Player2")
@onready var game_manager = get_node("/root/Game/GameManager")
@onready var timer: Timer = $Timer
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(body: Node2D) -> void:
	if body == player_1:
		game_manager.remove_point_player_1()
		game_manager.add_point_player_2()
		# If the player dies
		if game_manager.score_player_1 < 0:
			animation_player.play("death_sound")
			Engine.time_scale = 0.5
			body.get_node("CollisionShape2D").queue_free()
			body.get_node("AnimatedSprite2D").flip_v = true
			game_manager.add_round_player_2()
			timer.start()
	elif body == player_2:
		game_manager.remove_point_player_2()
		game_manager.add_point_player_1()
		# If the player dies
		if game_manager.score_player_2 < 0:
			animation_player.play("death_sound")
			Engine.time_scale = 0.3
			body.get_node("CollisionShape2D").queue_free()
			body.get_node("AnimatedSprite2D").flip_v = true
			game_manager.add_round_player_1()
			timer.start()

func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
