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
		for char in charNodes:
			print("char: ", char.jobName, " swift: ", char.swift)
			turnTracker.insert(char.jobName, char.swift)
			print("Added ", char.jobName, " to TurnTracker")
		
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

