extends Node

class_name BattleManager

var turnTracker : TurnTracker = null
"""
func _init():
	var foo = $Player/Job/Stats
	print("foo: ", foo)
"""	

func _ready():
	turnTracker = TurnTracker.new()
	if turnTracker:
		turnTracker._init()
		print("Initialized TurnTracker in BattleManager")
	addBattlerToTracker()

func addBattlerToTracker():
	var charNodes = $FindCharsBattle001.findCharacterNodes() as Array
	print("charNodes Array: ", charNodes)
	if turnTracker:
		for c in charNodes:
			if c.has_node("Job/Stats"):
				var stats = c.get_node("Job/Stats")
				print("char: ", stats.job_name, " swift: ", stats.swift)
				turnTracker.insert(stats.job_name, stats.swift)
				print("Added ", stats.job_name, " to TurnTracker")
			else:
				print("c doesn't have node")
		
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

