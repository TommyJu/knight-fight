extends Node

@onready var player_1_score: Label = $Player1Score
@onready var player_2_score: Label = $Player2Score
@onready var player_2_round: Label = $Player2Round
@onready var player_1_round: Label = $Player1Round


var score_player_1 = 0
var score_player_2 = 0

func _ready() -> void:
	# Adjust the text for rounds
	player_1_round.text = "Player 1: " + str(RoundCount.round_player_1)
	player_2_round.text = "Player 2: " + str(RoundCount.round_player_2)

func check_for_winner() -> void:
	if RoundCount.round_player_1 >= 3 || RoundCount.round_player_2 >=3:
		get_tree().change_scene_to_file("res://scenes/win_screen.tscn")

func add_round_player_1():
	RoundCount.incrment_round_player_1()
	player_1_round.text = "Player 1: " + str(RoundCount.round_player_1)
	check_for_winner()
func add_round_player_2():
	RoundCount.set("round_player_2", RoundCount.round_player_2 + 1)
	player_2_round.text = "Player 2: " + str(RoundCount.round_player_2)
	check_for_winner()

func add_point_player_1():
	score_player_1 += 1
	player_1_score.text = "Player 1 Coins: " + str(score_player_1)
	
func remove_point_player_1():
	score_player_1 -= 1
	player_1_score.text = "Player 1 Coins: " + str(score_player_1)
	
func add_point_player_2():
	score_player_2 += 1
	player_2_score.text = "Player 2 Coins: " + str(score_player_2)
	
func remove_point_player_2():
	score_player_2 -= 1
	player_2_score.text = "Player 2 Coins: " + str(score_player_2)

func set_score_player_1(number:int) -> void:
	score_player_1 = number
	
func set_score_player_2(number:int) -> void:
	score_player_2 = number

func reset_coins() -> void:
	set_score_player_1(0)
	set_score_player_2(0)
