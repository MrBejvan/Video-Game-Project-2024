extends Node

class_name BattleManager

var turnTracker : TurnTracker = null

func _ready():
	turnTracker = TurnTracker.new()
	if turnTracker:
		turnTracker._init()
		print("Initialized TurnTracker in BattleManager")
	addBattlerToTracker()
	var count = countTracker()
	if count > 0:
		print(count)
		sortTracker()
		
	print("printing turn order: ")
	printTurnOrder()

func addBattlerToTracker():
	var charNodes = $FindCharsForBattle.findCharacterNodes() as Array
	if turnTracker:
		for c in charNodes:
			if c.has_node("Job/Stats"):
				var stats = c.get_node("Job/Stats")
				
				#sanity check
				print("char: ", stats.job_name, " swift: ", stats.swift, " health: ", stats.health)
				
				turnTracker.insert(stats.job_name, stats.health, stats.swift)
				
				#sanity check
				#print("Added ", stats.job_name, " to TurnTracker")
			else:
				print("c doesn't have stats node")
		
func printTurnOrder():
	if turnTracker:
		turnTracker.printTracker()

func countTracker():
	return turnTracker.countCharsInTracker()
	
func sortTracker():
	turnTracker.sortTurnTracker()
