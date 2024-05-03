extends Node

class_name TurnTracker

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
	if current == null:
		current = head
		
		#sanity check
		print("head was null. head set to: ", head.job_name, " with a speed of ", head.swift, " and with ", head.health, " health")
	
	else:
		while current.nextUp != head and current.nextUp.swift <= current.swift:
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

func sortTurnTracker():
	if head == null:
		print("TurnTracker is empty; Cannot sort")
		return
	
	var nodes = []
	var temp = head
	current = head
	#print("current: ", current.job_name)
	
	while true:
		#print("current: ", current.job_name, " will be added to nodes array")
		nodes.append(current)
		current = current.nextUp
		if current == temp:
			break
			
	#sort the nodes array by swift data from highest to lowest		
	sortHelper(nodes)
	
	for i in range(nodes.size()):
		nodes[i].nextUp = nodes[(i + 1) % nodes.size()]
	
	head = nodes[0]	
	print("CharacterNodes re-linked. Head set to: ", head.job_name)
	
	current = head
	print("Current set to: ", current.job_name, " with ", current.nextUp.job_name, " up next")
	
func sortHelper(nodes):
	var n = nodes.size()
	var swapped = true
	
	while swapped:
		swapped = false
		for i in range(n - 1):
			if nodes[i].swift < nodes[i + 1].swift:
				var temp = nodes[i]
				#sanity check
				#print("node[i]: ", nodes[i].job_name)
				nodes[i] = nodes[i + 1]
				nodes[i + 1] = temp
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
	
	
func removeCharacter(job_name):
	if head == null:
		print("Tracker is empty, cannot remove character")
		return
		
	if head.job_name == job_name:
		if head.nextUp.job_name == job_name:
			#Only one node is present in the Tracker
			head = null
			current = null
			print("Only one node in the Tracker")
			return
		
		var temp = head
		head = head.nextUp
		var lastUp = head
		while lastUp.nextUp != temp:
			lastUp = lastUp.nextUp
		lastUp.nextUp = head
		if current == temp:
			current = head
			print("removeCharacter - current: ", current)
		return
		
	var cursor = head
	while cursor.nextUp != head:
		if cursor.nextUp.job_name == job_name:
			cursor.nextUp = cursor.nextUp.nextUp
			return
		cursor = cursor.nextUp
	

func printTracker():	
	#current = head
	if current == null:
		print("Tracker is empty")
		return
		
	while current.nextUp != head:
		print(current.job_name, ": ", current.swift, " health: ", current.health)
		current = current.nextUp
	print(current.job_name, ":", current.swift, " health: ", current.health)
