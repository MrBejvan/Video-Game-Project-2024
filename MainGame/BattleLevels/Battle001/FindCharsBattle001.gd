#Find a way to make this more universal so that the nodes added to the group don't need to be called by specific names - something like below...

extends Node

#define/pass in node as root of BattleScene tree

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

func findCharacterNodes():
	var rootNode = get_tree().get_root()
	print(rootNode)
	
	var allNodes = rootNode.get_children()
	var sceneChildrenNodes = []
	
	for node in allNodes:
		if node:
			print("nodes found")
			return
			
		else:
			print("no nodes found")
			return
		
		# Example: Check if the node has a specific script or property
		if node.has_method("is_character"):  # Assuming a method that identifies character nodes
			sceneChildrenNodes.append(node)
	
	return sceneChildrenNodes

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
