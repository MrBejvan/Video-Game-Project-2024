extends Node2D

var sceneMap = {
	"battle001": "res://MainGame/BattleScene/BattleScene001.tscn",
	"battle002": "res://MainGame/BattleScene/BattleScene002.tscn",
	"battle003": "res://MainGame/BattleScene/BattleScene003.tscn",
	"shop001": "res://MainGame/ShopScene/ShopScene001.tscn"
}
#var sceneKey = ""
var file







"""func _ready():
	var json_file_path = "res://MainGame/WorldMapScene/PathMap.json"
	
	if (json_file_path):
		file = FileAccess.open(json_file_path, file.READ)
		var jsonPathText = file.get_as_text()
		
		var jsonParsed = JSON.parse_string(jsonPathText)
		
		if (jsonParsed.error == OK):
			sceneMap = jsonParsed.result
		else:
			print("Error parsing JSON:", json_file_path)
		file.close()
	else:
		print("JSON file not found", json_file_path)

"""

