extends Node

class_name TurnTracker

#var path = "res://mechs/Battle/TurnTracker.gd"

var head : CharacterNode = null
var current : CharacterNode = null
var intitialized = false

class CharacterNode:
	var battler : String
	var health : int
	var swift : int   
	var nextUp: CharacterNode      # ref to character with next highest speed score -> include blocks for tie and potential edgecases/errors

func _init():
	intitialized = true
	

func _ready():
	var characterStats : CharacterStats

	
func insert(battler, health, swift):
		
	var newTurnNode = CharacterNode.new()
	newTurnNode.battler = battler
	newTurnNode.health = health
	newTurnNode.swift = swift
	newTurnNode.nextUp = null
	
	if head == null:
		newTurnNode.nextUp = newTurnNode
		head = newTurnNode
		print("Added node to TurnTracker: ", head.battler, " with speed: ", head.swift)
	else:
		current = head
		while current.nextUp != head and current.nextUp.swift > swift:
			current = current.nextUp

		newTurnNode.nextUp = current.nextUp
		current.nextUp  = newTurnNode
		if current.nextUp == head:
			head = newTurnNode
	return head

func printTracker():	
	current = head
	if current == null:
		print("Tracker is empty")
		return
		
	while current.nextUp != head:
		print(current.battler, ":", current.swift)
		current = current.nextUp
	print(current.battler, ":", current.swift)
