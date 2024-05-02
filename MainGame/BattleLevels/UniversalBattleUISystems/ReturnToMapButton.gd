extends Button

var worldMapPath = "res://MainGame/WorldMapScene/WorldMap.tscn"

func _on_pressed():
	if worldMapPath != "":
			get_tree().change_scene_to_file(worldMapPath)
