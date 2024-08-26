extends Control

var target
var arrowPos
var bpsDict = {}
var bpsKeysArr = []
var selecting_target = false

# Called when the node enters the scene tree for the first time.
func _ready():
	var findPositions = $FindCharPositions
	var bpsDict = findPositions.addCharNodesDict()
	var bpsKeysArr = bpsDict.keys()
	print(bpsKeysArr)
	
#this function recieves "attack" signal emitted from ActionMenuButton function _on_attack_pressed
func selectTarget():
	arrowPos = $SelectionArrow/SelectionArrowSprite/SelctionArrowMarker2.position
	var currentKey = bpsKeysArr[0]
	arrowPos = bpsDict[currentKey]
	
	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var current_target_index = 0
	if selecting_target:
		if Input.is_action_just_pressed("ui_right"):
			current_target_index = current_target_index + 1 % bpsKeysArr.size()
		elif Input.is_action_just_pressed("ui_left"):
			current_target_index = (current_target_index - 1 + bpsKeysArr.size()) % bpsKeysArr.size()
		elif Input.is_action_just_pressed("ui_accept"):
			selecting_target = false
			var selected_key = bpsKeysArr[current_target_index]
			target = bpsDict[selected_key]
			emit_signal("attack", target)
			


func _on_action_menu_button_attack():
	pass # Replace with function body.
