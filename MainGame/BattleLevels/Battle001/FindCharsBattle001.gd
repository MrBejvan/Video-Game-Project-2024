extends Node

#Find a way to make this more universal so that the nodes added to the group don't need to be called by specific names
"""extends Node

class_name BattleManager

func find_character_nodes():
	var all_nodes = get_tree().get_root().get_children_recursive()
	var character_nodes = []
	
	for node in all_nodes:
		# Example: Check if the node has a specific script or property
		if node.has_method("is_character"):  # Assuming a method that identifies character nodes
			character_nodes.append(node)
	
	return character_nodes"""

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
	
