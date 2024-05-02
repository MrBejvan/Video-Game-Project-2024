extends Button

var playerInArea = false;

var body
var parent_node = "res://MainGame/WorldMapScene/WorldMap.tscn"
var battleSceneDirectory 
var battleAreas2D = []
#var scenePath = ""

func _on_ready():
	#get the Battle Scene Path Directory
	battleSceneDirectory = get_node("SceneDictionary").sceneMap
	print(battleSceneDirectory)
	
	#get the Player Body
	body = get_node("Player")
	print("body: ", body)
	
	#build array with add Area2D nodes and connect signals to button
	for child in parent_node.get_children():
		if child is Area2D:
			battleAreas2D.append(child)
			child.connect("player_entered", Callable(self, "_on_body_entered"))
			child.connect("player_exited", Callable(self, "_on_body_exited"))
	print(battleAreas2D)
	
func _on_fight_pressed(scenePath):
	#this block changes current scene to the new scene file stored in scenePath only if player collisonshape is in the 2D area of N map location
	if (playerInArea == true and scenePath != ""):
		print("player in area and button pressed")
		get_tree().change_scene_to_file(scenePath)
	else:
		print("Cannot load scene because player is not is Area or scenePath is not valid")
		return
		
func _on_player_entered(scenePath):
	playerInArea = true
	return scenePath

func _on_area_2d_body_exited():
	playerInArea = false
