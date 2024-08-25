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
#max health 
@onready var health_max : int = stats.max_health
#current health
@onready var health_curr : int = stats.health
#min health
@onready var health_min : int = 0

@onready var marker_2d = $Marker2D


func _ready():
	var foo = null
	position = marker_2d.position

	
#basic attack function for combatant
func attack(target : Node):
	if target.has_method("take_damage"):
		var damage = stats.strength #add fancy formula at later date
		target.call("take_damage", damage)
	
	
#basic take damage function for combatant
func take_damage(hit):
	health_curr -= hit.damage
	health_curr = max(0, health_max)
	emit_signal("health_changed", health_curr)
	if (health_curr == health_min):
		die()
		
#basic death function - end battle, play "defeated", return to point right before player pressed 'start battle'
func die():
	if health_curr == 0:
		print("You are dead! Oh no!")
		pass
	
#can add modifier funcs here
		







