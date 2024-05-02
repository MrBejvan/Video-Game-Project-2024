extends Node2D

var parent_node : Node
var battleSceneDirectory 
var battleAreas2D = []

func _ready():
	parent_node = get_tree().get_current_scene()
	print("parent_node: ", parent_node)
	if parent_node:
		getBattleAreas(parent_node)
	else:
		print(parent_node, " not found")
	for area in battleAreas2D:
		#print("Area: ", area)
		area.connect("entered_area", Callable(self, "_on_player_entered"))
		area.connect("exited_area", Callable(self, "_on_player_exited"))
			
	#get the Battle Scene Path Directory
	battleSceneDirectory = get_node("SceneDictionary").sceneMap
	
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
