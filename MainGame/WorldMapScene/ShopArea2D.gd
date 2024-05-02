extends Area2D

var sceneName := "Shop"

#signals to emit
signal entered_area(sceneName)
signal exited_area(sceneName)


func player_entered_area(body, sceneName):
	if body.name == "Player":
		#edit for each BattleArea2D
		print("Player entered area: ", sceneName)
		emit_signal("entered_area", sceneName)
	else:
		print("not Player")

func player_exited_area(body):
	if body.name == "Player":
		print("Player exited area: ", sceneName)
		sceneName = ""
		emit_signal("exited_area", sceneName)
	else:
		print("not Player")
