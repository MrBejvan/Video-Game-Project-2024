extends Node2D

var battleSceneDirectory
var body

func _ready():
	battleSceneDirectory = get_node("SceneDictionary").sceneMap
	print(battleSceneDirectory)
	body = get_node("Player")
	print("body: ", body)
	
	# Connect signals from multiple Area2D nodes
	var area2d_1 = get_node("Battle001/Battle001Area2D")
	var area2d_2 = get_node("Battle002/Battle002Area2D")  # Add additional connections as needed

	# Connect the "player_entered" signal to the same handler
	area2d_1.connect("player_entered", Callable(self, "_on_body_entered"))
	#area2d_2.connect("player_entered", Callable(self, "_on_body_entered"))
	
	# (Repeat for all Area2D nodes from which you want to receive signals)

	
	#$Battle001/Battle001Area2D.connect("player_entered", self, "_on_body_entered")
	
func _on_body_entered(body):
	if body.has_method("_player"):
		#get the signal from Battle(x) Area2D
		var trigger
		if battleSceneDirectory.has(trigger):
			var nextScenePath = battleSceneDirectory[trigger]
			return nextScenePath




"""func _on_player_entered(scene_path):
	# This function will handle signals from any connected Area2D node
	print("Player entered scene with path:", scene_path)

	# Use the scene path to load the corresponding scene or perform other logic
	if scene_path in battleSceneDirectory.values():
		var next_scene = ResourceLoader.load(scene_path)
		get_tree().change_scene_to(next_scene)"""

		
"""
extends Node2D

var battleSceneDirectory  # This will hold the scene paths

func _ready():
	# Ensure the battleSceneDirectory is populated with scene paths
	battleSceneDirectory = get_node("SceneDictionary").sceneMap

	# Connect signals from Area2D nodes to handle scene transitions
	var area2d_1 = get_node("Battle001/Battle001Area2D")
	area2d_1.connect("player_entered", Callable(self, "_on_area2d_player_entered"))

func _on_area2d_player_entered(scene_path):
	print("Transitioning to scene:", scene_path)
	# Transition to the specified scene
	get_tree().change_scene(scene_path)  # Change to the new scene

		"""
