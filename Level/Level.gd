extends Node

var Score_Player = 0
var Score_AI = -1

func _on_AI_Win_Pos_body_entered(body):
	reset_ball()
	Score_AI += 1

func _on_Player_Win_Pos2_body_entered(body):
	reset_ball()
	Score_Player += 1

func _on_Countdown_Timer_timeout():
	get_tree().call_group('Ball_Group', 'restart_ball')
	$Ball.visible = true
	$Countdown_Label.visible = false

func _process(delta):
	# Update Scoreboard
	$Score_Player.text = str(Score_Player)
	$Score_AI.text = str(Score_AI)
	$Countdown_Label.text = str(int($Countdown_Timer.time_left) + 1)

func reset_ball():
	$Ball.visible = false
	$Countdown_Label.visible = true
	get_tree().call_group('Ball_Group', 'stop_ball')
	$Countdown_Timer.start()
	$Score_Sound.play()
	
	# Reset Players after every round
	$Paddle_Player.position.x = 30
	$Paddle_AI.position.x = 1280 - 30

