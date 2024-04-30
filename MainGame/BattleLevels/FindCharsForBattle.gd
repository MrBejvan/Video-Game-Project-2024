extends Node

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
