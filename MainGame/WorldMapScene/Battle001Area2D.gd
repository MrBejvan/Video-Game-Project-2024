extends Area2D

#signal to emit
signal player_entered(scene_path)
#variable to store scene path from SceneDictionary
var scenePath
#entered state; bool
var entered = false

#define path to Battle001
#@export var lvlPath = sceneDir

func getDirectory():
	var sceneDir = get_node("/root/WorldMap/SceneDictionary")
	print(sceneDir)
	return sceneDir

func _on_body_entered(body):
	var sceneDir = getDirectory()
	if sceneDir:
		var sceneMap = sceneDir.get("sceneMap")
		if sceneMap:
			print("sceneMap: ", sceneMap)
			
		scenePath = sceneMap.get("Battle001")
		emit_signal("player_entered", scenePath)
			
	#if body.has_method("_player"):

func _on_body_exited(body):
	pass # Replace with function body.
