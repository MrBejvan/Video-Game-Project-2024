extends Button

#var battleSceneDirectory = $SceneDictionary.sceneMap
var playerInArea = false;

var scenePath

func _on_ready():
	var rootNode = get_tree().get_current_scene()


func loadBattleScene(scenePath: String):
	if scenePath:
		print("loading scene: ", scenePath)
		load(scenePath)

func start_battle():
	#assign body to the Player node to get Collision data
	var body = get_node("Player")
	#get the WorldMap node
	var rootNode = get_tree().get_current_scene()
	print("root node: ", rootNode)
	#use collision function in WorldMap to pull data for dynamic scene transition
	var nextScenePath = rootNode._on_body_entered(body)
	if nextScenePath:
		#load battle scene based on nextScenePath (pulled from WorldMap _on_body_entered which pulls from battleSceneDirectory
		loadBattleScene(nextScenePath)
	else:
		print("Scene: ", scenePath, " cannot load")
		return


func _on_fight_pressed():
	start_battle()
	

"""

extends Button

# Function to initiate scene transition
func start_battle():
	# Get the reference to WorldMap and call its function to retrieve the desired scene path
	var world_map = get_tree().get_current_scene()
	if world_map and world_map.has_method("_on_area2d_player_entered"):
		# Example trigger: Simulate the "player_entered" signal
		scene_path = "res://MainGame/BattleLevels/Battle001/Battle001.tscn"  # Example scene path
		world_map._on_area2d_player_entered(scene_path)

func _on_pressed():
	start_battle()  # Trigger the battle start when the button is pressed


"""
