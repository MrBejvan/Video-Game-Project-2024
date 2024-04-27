extends Node

class_name BattleManager

var turnTracker : TurnTracker = null

func _ready():
	turnTracker = TurnTracker.new()
	if turnTracker:
		turnTracker._init()
		print("Initialized TurnTracker in BattleManager")
	addBattlerToTracker()

func addBattlerToTracker():
	var charNodes = $FindCharsBattle001.findCharacterNodes()
	if turnTracker:
		for char in charNodes:
			turnTracker.insert(char.battler, char.swift)
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

