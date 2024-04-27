extends Node

func findCharacterNodes():
	var rootNode = get_tree().get_current_scene()
	print("rootNode is: ", rootNode)
	
	#var allNodes = rootNode.get_children()
	var sceneChildrenNodes = []
	
	for node in rootNode.get_children():
		#sanity check
		"""
		if node:
			print("nodes found")
			return
			
		else:
			print("no nodes found")
			return
		print("node in rootNode: ", node)
		"""
		#checks for method identifying that children nodes of root have property 'character'
		if node.has_method("isCharacter"):
			#sanity check
			#print("node has isCharacter method")
			sceneChildrenNodes.append(node)
	
	print("Characters in current scene: ", sceneChildrenNodes)
	return sceneChildrenNodes
	
	
	
#---
#Thought I needed this, but found a built-in function called get_children() -> do not need children of children in scene tree for this functionality
"""
func getChildrenRecursive(node):
	var childNodeArr := []
	
	for childNode in node.get_child():
		if childNode.get_child_count() > 0:
			
			childNodeArr.append(childNode)
			
			childNodeArr.append_array(getChildrenRecursive(childNode))
		else:
			childNodeArr.append(childNode)
			
	print(childNodeArr)		
	return childNodeArr
"""
#original implementation, but was limiting to functionality and required more work than was necessary
"""
func findCharacterNodes():
	if $Player:
		var player = get_node("/Battle001/Player")
		player.add_to_group("battler_group")
	else:
		print("Player not added to group")
		
	if $GoblinEnemy:
		$GoblinEnemy.add_to_group("battler_group")
	else:
		print("GoblinEnemy not added to group")
		
		
	#retrieve all nodes in the 'battler group'
	return get_tree().get_nodes_in_group("battler_group")
	"""
