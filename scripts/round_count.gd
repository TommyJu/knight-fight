extends Node2D

const MAX_ROUNDS = 3

var round_player_1 = 0
var round_player_2 = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func incrment_round_player_1() -> void:
	round_player_1 += 1
	
func incrment_round_player_2() -> void:
	print("incrementing p2 rounds")
	print(round_player_2)
	round_player_2 += 1

func set_round_player_1(number:int) -> void:
	round_player_1 = number
	
func set_round_player_2(number:int) -> void:
	round_player_2 = number

func reset_round() -> void:
	set_round_player_1(0)
	set_round_player_2(0)

func check_for_winner() -> bool:
	return RoundCount.round_player_1 >= MAX_ROUNDS || RoundCount.round_player_2 >=MAX_ROUNDS

func determine_winner() -> String:
	if round_player_1 > round_player_2:
		return "Player 1 WINS"
	elif round_player_2 > round_player_1:
		return "Player 2 WINS"
	else:
		return "no Winner"
