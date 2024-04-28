extends Node2D

#This class combined with CharacterStats can be applied to both player character(s) and enemies
class_name Battler

const DEFAULT_CHANCE = 0.75


#add method for identifying as 'character' 
func isCharacter():
	return true


#reference to characterstats (skeleton for stats and attributes)
@onready var stats : CharacterStats = $Job/Stats
#character skills
@onready var skills = $Job/Skills
#current health 
@onready var health : int = 0


func _ready():
	
	"""
	#sanity check
	if stats.job_name:
		print("stats job_name is good: ", stats.job_name)
	
	
	var job_name = $Job/Stats.job_name
	var hp = stats.health
	var swift = stats.swift
	print(job_name, hp, swift)
	"""
#basic attack function for combatant
func attack(target : Node):
	if target.has_method("take_damage"):
		var damage = stats.strength #add fancy formula at later date
		target.call("take_damage", damage)
	
	
#basic take damage function for combatant
func take_damage(hit):
	health -= hit.damage
	health = max(0, health)
	emit_signal("health_changed", health)
	if (health <= 0):
		die()
		
#basic death function - end battle, play "defeated", return to point right before player pressed 'start battle'
func die():
	pass
	
#can add modifier funcs here
		







