extends Node2D

var battleSceneDirectory
var body

func _ready():
	battleSceneDirectory = get_node("SceneDictionary").sceneMap
	print(battleSceneDirectory)
	body = get_node("Player")
	
	# Connect signals from multiple Area2D nodes
	var area2d_1 = get_node("Battle001/Battle001Area2D")
	var area2d_2 = get_node("Battle002/Battle002Area2D")  # Add additional connections as needed

	# Connect the "player_entered" signal to the same handler
	area2d_1.connect("player_entered", self, "_on_player_entered")
	area2d_2.connect("player_entered", self, "_on_player_entered")
	
	# (Repeat for all Area2D nodes from which you want to receive signals)

	
	#$Battle001/Battle001Area2D.connect("player_entered", self, "_on_body_entered")
	
func _on_body_entered(body):
	print("body: ", body)
	if body.has_method("_player"):
		#get the signal from Battle(x) Area2D
		var trigger
		if battleSceneDirectory.has(trigger):
			var nextScenePath = battleSceneDirectory[trigger]
			return nextScenePath
