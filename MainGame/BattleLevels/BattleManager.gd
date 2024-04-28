extends Node

class_name BattleManager

var turnTracker : TurnTracker = null

"""
#sanity check
func _init():
	var foo = $Player/Job/Stats
	print("foo: ", foo)
"""	

func _ready():
	var turnTracker = TurnTracker.new()
	if turnTracker:
		turnTracker._init()
		print("Initialized TurnTracker in BattleManager")
	addBattlerToTracker()
	print("")
	printTurnOrder()

func addBattlerToTracker():
	var charNodes = $FindCharsBattle001.findCharacterNodes() as Array
	print("charNodes Array: ", charNodes)
	if turnTracker:
		for c in charNodes:
			if c.has_node("Job/Stats"):
				var stats = c.get_node("Job/Stats")
				print("char: ", stats.job_name, " swift: ", stats.swift, "health: ", stats.health)
				turnTracker.insert(stats.job_name, stats.swift, stats.health)
				print("Added ", stats.job_name, " to TurnTracker")
			else:
				print("c doesn't have node")
		
func printTurnOrder():
	if turnTracker:
		turnTracker.printTracker()

