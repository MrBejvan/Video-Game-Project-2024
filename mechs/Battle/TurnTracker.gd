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
	

func _ready():
	var characterStats : CharacterStats
	if characterStats:
		print("ready: ", characterStats.job_name, " ", characterStats.health, " ", characterStats.swift)

	
func insert(job_name, health, swift):
		
	var newTurnNode = CharacterNode.new()
	newTurnNode.job_name = job_name
	newTurnNode.health = health
	newTurnNode.swift = swift
	newTurnNode.nextUp = null
	
	print(newTurnNode.job_name, " ", newTurnNode.health, " ", newTurnNode.swift)
	
	#sanity check
	print("Added node to TurnTracker: ", newTurnNode.job_name, " with speed: ", newTurnNode.swift)
	
	if head == null:
		newTurnNode.nextUp = newTurnNode
		head = newTurnNode
		
		#sanity check
		print("head was null. head set to: ", head, "with a speed of ", head.swift, " and with ", head.health, " health")
		
	else:
		current = head
		while current.nextUp != head and current.nextUp.swift >= swift:
			current = current.nextUp

		newTurnNode.nextUp = current.nextUp
		current.nextUp  = newTurnNode
		if current.nextUp == head:
			head = newTurnNode
			
	print("first up is ", current.job_name, "with ", current.nextUp.job_name, "up next")
	return head

func printTracker():	
	#current = head
	if current == null:
		print("Tracker is empty")
		return
		
	var temp = current	
	while current.nextUp != head:
		print(current.job_name, ":", current.swift)
		current = current.nextUp
	print(current.job_name, ":", current.swift)
