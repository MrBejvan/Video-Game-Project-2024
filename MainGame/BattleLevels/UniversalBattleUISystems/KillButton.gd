extends Button

signal killButton

var killName
var targetNode

func _ready():
	var rootNode = get_tree().get_current_scene()
	var targetName = "FindCharsForBattle"
	
	var targetNode = findNodeRecursively(rootNode, targetName)
	if targetNode:
		print("targetNode found")
		return targetNode
	else:
		print("not found")
	
func findNodeRecursively(node: Node, targetName: String):
	if node.name == targetName:
		return node
	for child in node.get_children():
		var result = findNodeRecursively(child, targetName)
		if result:
			return result
	return null
	
func prepKillButton():
	var charNodes = targetNode.findCharacterNodes() as Array
	print("killButton - ", charNodes)
	#$FindCharsForBattle.findCharacterNodes() as Array
	var charCount = charNodes.size()
	var killNum = randi() % charCount
	
	for c in charNodes:
		if c.has_node("Job/Stats"):
				var stats = c.get_node("Job/Stats")
				
				
				
	var killName = charNodes[killNum].stats.job_name
	if killName:
		print(killName)
		return killName
	else:
		print("no killName")
	
	
func _on_pressed():
	prepKillButton()
	emit_signal("killButton", killName)


