extends Area2D

#define path to Battle001
@export var lvlPath := "res://MainGame/BattleLevels/Battle001/Battle001.tscn"

#signal to emit when player enters the area2D
signal player_entered(scene_path: String)

func _ready():
	self.connect("body_entered", self, "_on_body_entered")
	self.connect("player_entered", self, "_on_player_entered")
	
func _on_body_entered(body):
	if body.has_method("_player"):
		emit_signal("player_entered", lvlPath)

func _on_player_entered(scene_path):
	print("Player entered: ", scene_path)
	return scene_path
