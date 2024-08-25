extends Control

var target
var arrowPos
var bpsDict = {}
var bpsKeysArr = []


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
	
	
	emit_signal("attack", target)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if selecting_target:
		if Input.is_action_just_pressed("ui_right"):
			current_target_index


func _on_action_menu_button_attack():
	pass # Replace with function body.
