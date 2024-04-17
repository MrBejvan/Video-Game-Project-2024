extends CharacterBody2D

#const characterName := "Sword & Board"

#const STARTING_STATS = "res://mechs/Character/starting_stats.gd"

const XP_DATABASE = "res://mechs/TestDatabase.json"
const MAX_LEVEL = 5

var XP_Table_Data = {}

func _ready():
	XP_Table_Data = get_xp_data()
	print(XP_Table_Data)

func get_xp_data() -> Dictionary:
	var file = FileAccess.open(XP_DATABASE, FileAccess.READ)
	var data = JSON.parse_string(file.get_as_text())
	return data
	
var Level : int = 1:
	set(value):
		Level = value
		%Label.text = str(value)
		
var current_xp = 0:
	set(value):
		current_xp = value
		var max_xp = get_max_xp_at(Level)
		
		if current_xp >= max_xp and Level < MAX_LEVEL:
			Level +=1
			current_xp -=max_xp
		elif Level == MAX_LEVEL:
			current_xp = 0


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func get_max_xp_at(level):
	return XP_Table_Data[str(level)]["need"]
	


func _on_button_pressed():
	pass # Replace with function body.
