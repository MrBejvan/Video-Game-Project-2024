extends Control

class_name CharacterPosition

var bpsDict : Dictionary
var sceneChildrenNodes : Array

func findCharacterNodes():
	var rootNode = get_tree().get_current_scene()
	
	#sanity check
	#print("rootNode is: ", rootNode)
	#var allNodes = rootNode.get_children()
	
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
	
func addCharNodesDict():
	var CharNodes : Array = findCharacterNodes()
	
	for character in CharNodes:
		var bps = character.get_position()
		
		if character.has_node("Job/Stats"):
			var stats = character.get_node("Job/Stats")
			var character_name = stats.job_name
			
			bpsDict[character_name] = bps
		
	print(bpsDict)
	return bpsDict
