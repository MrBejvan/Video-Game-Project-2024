extends Area2D

var sceneName := "StartingLocation"

#signals to emit
signal entered_area(sceneName: String)
signal exited_area(sceneName: String)


func player_entered_area(body):
	if body.name == "Player":
		#edit for each BattleArea2D
		emit_signal("entered_area", sceneName)
	else:
		print("not Player")

func player_exited_area(body):
	if body.name == "Player":
		emit_signal("exited_area", sceneName)
	else:
		print("not Player")
