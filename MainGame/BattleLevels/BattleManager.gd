extends Node

class_name BattleManager

var turnTracker : TurnTracker = null

func _ready():
	turnTracker = TurnTracker.new()
	if turnTracker:
		turnTracker._init()
		print("Initialized TurnTracker in BattleManager")
	
	
"""
func findCharacterNodes():
	
	$Player.add_to_group("battler_group")
	$GoblinEnemy.add_to_group("battler_group")
	
	#retrieve all nodes in the 'battler group'
	return get_tree().get_nodes_in_group("battler_group")
"""


func addBattlerToTracker(battler, swift):
	var charNodes = $FindCharBattle001.findCharacterNodes()
	if turnTracker:
		for char in charNodes:
			pass
		turnTracker.insert(battler, swift)
		print("Added battler to TurnTracker")
		
func printTurnOrder():
	if turnTracker:
		turnTracker.printTracker()
	
	
"""	
func getCharacterStats():
	var hp: int = ($Battler.stats as CharacterStats).health
	var swift: int = ($Battler.stats as CharacterStats).swift
	print(hp)
	print(swift)
"""	

