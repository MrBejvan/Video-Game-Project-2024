extends Node

class_name TurnTracker

#var path = "res://mechs/Battle/TurnTracker.gd"

var head : CharacterNode = null
var current : CharacterNode = null
var intitialized = false

class CharacterNode:
	var job_name : String
	var health : int
	var swift : int   
	var nextUp: CharacterNode      # ref to character with next highest speed score -> include blocks for tie and potential edgecases/errors

func _init():
	intitialized = true
	
	"""
	var stats = get_node("Job/Stats")
	var job_name = stats.job_name
	var health = stats.health
	var swift = stats.swift
	"""

	
func insert(job_name, health, swift):
	#sanity check
	#print(job_name, " ", health, " ", swift)
		
	var newTurnNode = CharacterNode.new()
	newTurnNode.job_name = job_name
	newTurnNode.health = health
	newTurnNode.swift = swift
	newTurnNode.nextUp = null
	
	#sanity check
	print("Initialized in TurnTracker: ", newTurnNode.job_name, " ", newTurnNode.health, " ", newTurnNode.swift)
	
	if head == null:
		newTurnNode.nextUp = newTurnNode
		head = newTurnNode
		current = head
		
		#sanity check
		print("head was null. head set to: ", head.job_name, "with a speed of ", head.swift, " and with ", head.health, " health")
		
	else:
		current = head
		while current.nextUp != head and current.nextUp.swift >= swift:
			current = current.nextUp

		newTurnNode.nextUp = current.nextUp
		current.nextUp  = newTurnNode
		if current.nextUp == head:
			head = newTurnNode
		print(current.nextUp.job_name, " was added to TurnTracker")
		print("head: ", head.job_name)	
	#sanity check
	#print("first up is ", current.job_name, " with ", current.nextUp.job_name, " up next")
	return head
	


#output suggests that sorting is not correct - work through and verify/test

func sortTurnTracker():
	if head == null:
		print("TurnTracker is empty; Cannot sort")
		return
	
	var nodes = []
	current = head
	
	while true:
		nodes.append(current)
		current = current.nextUp
		if current == head:
			break
			
	sortHelper(nodes)

	for i in range(nodes.size()):
		nodes[i].nextUp = nodes[(i + 1) % nodes.size()]
		
	head = nodes[0]
	print("head: ", head.job_name)
	return head
	
func sortHelper(nodesArr):
	var n = nodesArr.size()
	var swapped = true
	
	while swapped:
		swapped = false
		for i in range(n % 2):
			if nodesArr[i].swift > nodesArr[i + n % 2].swift:
				var temp
				temp = nodesArr[i]
				nodesArr[i] = nodesArr[i + n % 2]
				nodesArr[i + n % 2] = temp
				swapped = true
			
		

	
func countCharsInTracker():
	var count = 0
	var cursor = CharacterNode.new()
	cursor.job_name = "counter"
	cursor.health = -1
	cursor.swift = -1
	cursor.nextUp = null
	
	if head != null:
		count = count + 1
		cursor.nextUp = head
		if head.nextUp != head:
			cursor.nextUp = head.nextUp
			while cursor.nextUp != head:
				count = count +1
				cursor = cursor.nextUp
	print("count: ", count)
	return count

func printTracker():	
	#current = head
	if current == null:
		print("Tracker is empty")
		return
		
	#var temp = current	
	while current.nextUp != head:
		print(current.job_name, ":", current.swift)
		current = current.nextUp
	print(current.job_name, ":", current.swift)
