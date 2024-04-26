extends Node

func findCharacterNodes():
	
	$Player.add_to_group("battler_group")
	$GoblinEnemy.add_to_group("battler_group")
	
	#retrieve all nodes in the 'battler group'
	return get_tree().get_nodes_in_group("battler_group")
	
