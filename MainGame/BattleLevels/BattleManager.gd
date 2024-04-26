extends Node

class_name BattleManager

func _init():
	var turnTracker : TurnTracker = TurnTracker.new()
		
	
func getCharacterStats():
	var hp: int = ($Battler.stats as CharacterStats).health
	var swift: int = ($Battler.stats as CharacterStats).swift
	print(hp)
	print(swift)


