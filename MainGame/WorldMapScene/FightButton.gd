extends Button

var playerInArea = false;
var scenePath : String

signal buttonPressed(sceneName: String)

func _on_fight_pressed():
	if playerInArea:
		if scenePath != "":
			get_tree().change_scene_to_file(scenePath)
		else:
			print("Cannot change scene. Scene path is invalid.")
	else:
		print("Player is not in the area")	
