extends Button

var playerInArea = false;
var sceneName : String
var scenePath : String

signal buttonPressed(sceneName: String)


func _on_fight_pressed():
	if playerInArea:
		scenePath = getPath(sceneName)
		if scenePath != "":
			get_tree().cahnge_scene_to_file(scenePath)
		else:
			print("Cannot change scene. Scene path is invalid.")
	else:
		print("Player is not in the area")

func getDirectory():
	var sceneDir = get_node("/root/WorldMap/SceneDictionary")
	print(sceneDir)
	return sceneDir

func getPath(sceneName):
	
	if sceneName != "":
		print(sceneName)
	else:
		print("sceneName not valid")
	var sceneDir = getDirectory()
	print("sceneDir: ", sceneDir)
	if sceneDir:
		var sceneMap = sceneDir.get("sceneMap")
		if sceneMap:
			print("sceneMap: ", sceneMap)
		else:
			print("sceneMap not valid")
			scenePath = sceneMap.get(sceneName)
		if scenePath:
			return scenePath
		else:
			print("Invalid scene path: ", scenePath)
