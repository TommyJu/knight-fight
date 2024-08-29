extends Node

@onready var player_1_score: Label = $Player1Score
@onready var player_2_score: Label = $Player2Score


var score_player_1 = 0
var score_player_2 = 0

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
	score_player_1 -= 1
	player_2_score.text = "Player 2 Coins: " + str(score_player_2)
