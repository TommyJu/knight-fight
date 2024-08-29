extends Node

const ROUND_LENGTH = 30

@onready var time_remaining_label: Label = $TimeRemaining
@onready var timer: Timer = $Timer
var time_remaining = ROUND_LENGTH
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time_remaining = timer.time_left
	time_remaining_label.text = "Time: " + str(floor(timer.time_left))
