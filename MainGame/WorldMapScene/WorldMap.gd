extends Node2D

var battleSceneDirectory = $SceneDictionary.sceneMap

func _ready():
	pass
	#$TextureRect/Battle001/Battle001Area2D.connect("player_entered", self, "_on_player_entered")
	
func _on_body_entered(body):
	if body.has_method("_player"):
		#get the signal from Battle(x) Area2D
		var trigger
		if battleSceneDirectory.has(trigger):
			var nextScenePath = battleSceneDirectory[trigger]
			return nextScenePath

