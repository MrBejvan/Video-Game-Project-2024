extends Node

class_name TurnTracker

#class_name TurnTracker
class CharacterNode:
	var battler : Battler   #use character_name as unique call?
	var name : String
	var swift : int   # speed = swift (lol)
	var nextUp: CharacterNode      # ref to character with next highest speed score -> include blocks for tie and potential edgecases/errors

	func _init():
		self.battler = battler
		self.swift = swift
		self.next = null
		print("CharacterNode initialized with ", self.battler, "and speed", self.swift)

var head : CharacterNode = null
var initialized := false

func _init():
	initialized = true

func insert(battler, swift):
	var newTurnNode = CharacterNode.new()
	newTurnNode.battler = battler
	newTurnNode.swift = swift
	
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
