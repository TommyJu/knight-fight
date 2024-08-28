extends Area2D

@onready var timer: Timer = $Timer
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_body_entered(body: Node2D) -> void:
	animation_player.play("death_sound")
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	body.get_node("AnimatedSprite2D").flip_v = true
	timer.start()
	

func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
