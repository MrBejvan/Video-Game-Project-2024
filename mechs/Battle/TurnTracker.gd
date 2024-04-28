extends Node

class_name TurnTracker

class CharacterNode:
	var battler : String
	var health : int
	var swift : int   
	var nextUp: CharacterNode      # ref to character with next highest speed score -> include blocks for tie and potential edgecases/errors

	func _init():
		self.battler
		self.swift
		self.health
		self.nextUp
		print("CharacterNode initialized with ", self.battler, "and speed", self.swift)


var initialized := false

#add to init above?
func _init():
	initialized = true
	#var head : CharacterNode = null

func _ready():
	var characterStats : CharacterStats

	
func insert(battler, health, swift):
	var head : CharacterNode = null
	
	var newTurnNode = CharacterNode.new()
	newTurnNode.battler = battler
	newTurnNode.health = health
	newTurnNode.swift = swift
	newTurnNode.nextUp = null
	
	if head == null:
		newTurnNode.nextUp = newTurnNode
		head = newTurnNode
		print("Added first node to TurnTracker: ", head.battler, "with speed: ", head.swift)
	else:
		var current = head
		while current.nextUp != head and current.nextUp.swift > swift:
			current = current.nextUp

		newTurnNode.nextUp = current.nextUp
		current.nextUp  = newTurnNode

func printTracker():
	var head : CharacterNode = null
	var current = head
	if current == null:
		print("Tracker is empty")
		return
		
	while current.next != head:
		print(current.battler, ":", current.swift)
		current = current.next
	print(current.battler, ":", current.swift)
