extends CharacterBody2D

const XP_DATABASE = "res://mechs/TestDatabase.json"
const MAX_LEVEL = 5

#Experience System

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
			
		var total = min( (XP_Table_Data[str(Level)]["total"] + current_xp), XP_Table_Data[str(MAX_LEVEL)]["total"])
		
		
		%TotalXP.text = str(total)
		
		%ProgressBar.max_value = get_max_xp_at(Level)
		%ProgressBar.value = current_xp
		
func get_max_xp_at(level):
	return XP_Table_Data[str(level)]["need"]
	


func _on_button_pressed():
	current_xp += 100
	
	

#Stats and abilities

var health : int :
	set(value):
		health = value
		%HP.text = str(value)
		
var strength : int :
	set(value):
		strength = value
		%strength.text = str(value)
	
var swift : int :
	set(value):
		swift = value
		%swift.text = str(value)
		
var defense : int :
	set(value):
		defense = value
		%defense.text = str(value)
