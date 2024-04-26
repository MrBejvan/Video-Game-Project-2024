extends Node

class CharacterNode:
	var battler : Battler   #use character_name as unique call?
	var swift : int   # speed = swift (lol)
	var nextUp      # ref to character with next highest speed score -> include blocks for tie and potential edgecases/errors

	func _init(Battler):
		self.battler = Battler
		self.swift = 0
		self.next = null
		
func getCharacterStats():
	var hp: int = ($Battler.stats as CharacterStats).health
	var swift: int = ($Battler.stats as CharacterStats).swift
	print(hp)
	print(swift)

class TurnTracker:
	var head

	func _init():
		head = null
		print("TurnTracker initialized")
		
	
	func insert(Battler, swift):                  #correct; insert based on character keyword map
		var newTurnNode = CharacterNode.new(Battler)
		#var newTurnNode.battler = battler
		#var newTurnnode.swift = swift
		
		if head == null:
			newTurnNode.next = newTurnNode
			head = newTurnNode
		else:
			var current = head
			while current.next != head and current.next.swift > swift:
				current = current.next

			newTurnNode.next = current.next
			current.next  = newTurnNode

	func printTracker():
		var current = head
		if current == null:
			print("Empty")
			return
		while current.next != head:
			print(current.battler, ":", current.swift)
			current = current.next
		print(current.battler, ":", current.swift)
		
	func _ready():
		printTracker()

