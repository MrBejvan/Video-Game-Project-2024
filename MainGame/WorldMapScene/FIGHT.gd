extends Button

var playerInArea = false;

var scenePath
var parent_node = "res://MainGame/WorldMapScene/WorldMap.tscn"

#res://MainGame/BattleScene/BattleScene001.tscn

func _on_ready():
	pass
	


func _on_fight_pressed():
	if (parent_node):
		print(scenePath)
		scenePath = parent_node.sceneMap.get("battle001","")
		
		print (scenePath)
		
	#this block grabs the current scene and then change it to the new scene file only if player collisonshape is in the 2D area of N map location
	if (playerInArea == true and scenePath != ""):
		print("player in area and button pressed")
		
		get_tree().change_scene_to_file("res://MainGame/BattleScene/BattleScene001.tscn")

"""
func _on_area_2d_body_entered(body):
		playerInArea = true



func _on_area_2d_body_exited(body):
	playerInArea = false
"""


func _on_pressed():
	pass # Replace with function body.
