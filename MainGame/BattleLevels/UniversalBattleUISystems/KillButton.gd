extends Button

signal killButton

var killName
var targetNode

func _ready():
	pass
	
func prepKillButton():
	var charNodes = findCharacterNodes() as Array
	print("killButton - ", charNodes)
	#$FindCharsForBattle.findCharacterNodes() as Array
	var charCount = charNodes.size()
	var killNum = randi() % charCount
	
	for c in charNodes:
		if c.has_node("Job/Stats"):
				var stats = c.get_node("Job/Stats")
				
				
				
	var killName = charNodes[killNum].stats.job_name
	if killName:
		print("prepKillButton: ", killName)
		return killName
	else:
		print("no killName")

func findCharacterNodes():
	var rootNode = get_tree().get_current_scene()
	var sceneChildrenNodes = []
	
	for node in rootNode.get_children():
		#checks for method identifying that children nodes of root have property 'character'
		if node.has_method("isCharacter"):
			#sanity check
			#print("node has isCharacter method")
			sceneChildrenNodes.append(node)
	
	#sanity check
	#print("Characters in current scene: ", sceneChildrenNodes)
	
	return sceneChildrenNodes
	
func _on_pressed():
	var killName = prepKillButton()
	emit_signal("killButton", killName)


