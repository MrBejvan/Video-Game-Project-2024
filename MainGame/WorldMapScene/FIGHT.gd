extends Button


var playerInArea = false;



func _on_fight_pressed():
	print("button pressed")
	#this creates a variable for the new scene -> Battle001
	
	#this block grabs the current scene and then change it to the new scene file only if player collisonshape is in the 2D area of N map location
	if (playerInArea == true):
		print("player in area and button pressed")
		
		get_tree().change_scene_to_file("res://MainGame/BattleScene/BattleScene001.tscn")


func _on_area_2d_body_entered(body):
		playerInArea = true



func _on_area_2d_body_exited(body):
	playerInArea = false
