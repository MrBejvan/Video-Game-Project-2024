extends Node

class CharacterNode:
	var battler : Battler   #use character_name as unique call?
	var swift       # speed = swift (lol)
	var nextUp      # ref to character with next highest speed score -> include blocks for tie


func _init(battler):
	self.battler = battler
	#self.swift = swift
	self.next = null


class TurnTracker:
	var head

	func _init():
		head = null
	
	func insert(battler, speed):                  #correct; insert based on character keyword map
		var newTurnNode = CharacterNode.new()

		if head == null:
			newTurnNode.next = newTurnNode
			head = newTurnNode
		else:
			var current = head
			while current.next != head and current.next.speed < speed:
				current = current.next

			newTurnNode.next = current.next
			current.next  = newTurnNode

	func printTracker():
		var current = head
		if current == null:
			print("Empty")
			return
		while current.next != head:
			print(current.battler, ":", current.speed)
			current = current.next
		print(current.battler, ":", current.seed)

