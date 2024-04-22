extends CharacterBody2D

#add movement functionality to the worldsceneplayere

var speed = 200  # Adjust as needed
var movement_vector = Vector2.ZERO

func _process(_delta):
	# Reset velocity
	velocity = Vector2.ZERO

	# Handle input
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1

	# Normalize velocity if moving diagonally to maintain consistent speed
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

	# Move the player
	move_and_slide()



func _on_fight_pressed():
	print("button pressed")
	#this creates a variable for the new scene -> Battle001
	var new_battle = load("res://MainGame/BattleScene/BattleScene001.tscn") 
	
	#this block grabs the current scene and then change it to the new scene
	#var current_scene = get_tree()
	get_tree().change_scene_to(new_battle)
