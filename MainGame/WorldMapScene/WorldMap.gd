extends Node2D

var parent_node = "res://MainGame/WorldMapScene/WorldMap.tscn"
var battleSceneDirectory 
var battleAreas2D = []

func _ready():
	getBattleAreas(parent_node)
	for area in battleAreas2D:
		#print("Area: ", area)
		area.connect("entered_area", Callable(self, "_on_player_entered"))
		area.connect("exited_area", Callable(self, "_on_player_exited"))
			
	#get the Battle Scene Path Directory
	battleSceneDirectory = get_node("SceneDictionary").sceneMap
	
func getBattleAreas(parent_node):
	#build array with add Area2D nodes and connect signals to button
	for child in parent_node.get_children():
		if child is Area2D:
			battleAreas2D.append(child)
		if child.get_child_count() > 0:
			getBattleAreas(child)
	#return battleAreas2D
	
func _on_player_entered(sceneName):
	print("Player entered area: ", sceneName)
	
	var fightButton = get_node("FightButton")
	if fightButton:
		fightButton.set("playerInArea", true)
		fightButton.set("sceneName", sceneName)


func _on_player_exited(sceneName):
	print("Player exited area: ", sceneName)
	
	var fightButton = get_node("FightButton")
	if fightButton:
		fightButton.set("playerInArea", false)
		fightButton.set("sceneName", sceneName)
