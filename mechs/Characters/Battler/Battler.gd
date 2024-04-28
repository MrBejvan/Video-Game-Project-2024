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


"""var battler := "Default"
var hp := 0
var swift := 0
var nextUp
"""


#initialize character with specific stats
func _ready():
	var battler = stats.job_name
	print("battler: ", battler)
	var hp = stats.health
	print(hp)
	var swift = stats.swift
	print(swift)
	print("")


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
		







