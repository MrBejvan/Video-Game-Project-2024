extends Node2D

signal pathToBattle

var parent_node : Node
var battleSceneDirectory 
var battleAreas2D = []
var scenePath

func _ready():
	parent_node = get_tree().get_current_scene()
	print("parent_node: ", parent_node)
	print("")
	if parent_node:
		var areaArray = getBattleAreas(parent_node)
		#print("areaArray: ", areaArray)
		print("")
		for area in areaArray:
			#print("Area: ", area)
			#print("")
			area.connect("entered_area", Callable(self, "getPath"))
			area.connect("exited_area", Callable(self, "_on_player_exited"))
	else:
		print(parent_node, " not found")
		
	#get the Battle Scene Path Directory
	battleSceneDirectory = get_node("SceneDictionary").sceneMap
	#print("battleSceneDirectory: ", battleSceneDirectory)
	print("")

func getBattleAreas(node):
	if node == null:
		print("Error: node is null")
		return
	#build array with add Area2D nodes and connect signals to button
	for child in node.get_children():
		if child is Area2D:
			battleAreas2D.append(child)
		elif child.get_child_count() > 0:
			getBattleAreas(child)
	return battleAreas2D
	
func getDirectory():
	var sceneDir = get_node("/root/WorldMap/SceneDictionary")
	print(sceneDir)
	return sceneDir

func getPath(sceneName):
	if sceneName != "":
		print("getPath - sceneName: ", sceneName)
	else:
		print("getPath - sceneName not valid")
	if battleSceneDirectory:
		#print("getPath - battleSceneDirectory: ", battleSceneDirectory)
		scenePath = battleSceneDirectory.get(sceneName)
		if scenePath:
			print("getPath - scenePath: ", scenePath, " sceneName: ", sceneName)
			print("")
			
			#script to update button to execute scene transition on pressed
			var fightButton = get_node("FightButton")
			if fightButton:
				print("fightButton is valid")
				fightButton.set("playerInArea", true)
				fightButton.set("scenePath", scenePath)
			
			return scenePath and sceneName
		else:
			print("getPath - Invalid scene path: ", scenePath)
			print("")
	else:
		print("getPath - sceneMap not valid")
		print("")
		

func _on_player_exited(sceneName):
	print("Player exited area: ", sceneName)
	print("")
	sceneName = ""
	if sceneName == "":
		print("sceneName reset")
		print("")
	var fightButton = get_node("FightButton")
	if fightButton:
		fightButton.set("playerInArea", false)
		fightButton.set("sceneName", sceneName)

