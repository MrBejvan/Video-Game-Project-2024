extends Node

class_name TurnTracker

class CharacterNode:
	var battler : String
	var hp : int
	var swift : int   
	var nextUp: CharacterNode      # ref to character with next highest speed score -> include blocks for tie and potential edgecases/errors

"""
	func _init():
		self.battler
		self.swift
		self.hp
		self.nextUp
		print("CharacterNode initialized with ", self.battler, "and speed", self.swift)
"""

var head : CharacterNode = null
var initialized := false

#add to init above?
func _init():
	initialized = true
	
func _ready():
	var characterStats : CharacterStats
	
func insert(battler, swift):
	var newTurnNode = CharacterNode.new()
	newTurnNode.battler = battler
	newTurnNode.hp = battler.hp
	newTurnNode.swift = swift
	newTurnNode.nextUp = head
	
	if head == null:
		newTurnNode.next = newTurnNode
		head = newTurnNode
		print("Added first node to TurnTracker: ", head.battler, "with speed: ", head.swift)
	else:
		var current = head
		while current.next != head and current.next.swift > swift:
			current = current.next

		newTurnNode.next = current.next
		current.next  = newTurnNode

func printTracker():
	var current = head
	if current == null:
		print("Tracker is empty")
		return
		
	while current.next != head:
		print(current.battler, ":", current.swift)
		current = current.next
	print(current.battler, ":", current.swift)
