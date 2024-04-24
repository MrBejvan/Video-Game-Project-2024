extends Node

#This class combined with CharacterStats can be applied to both player character(s) and enemies
class_name Battler

#reference to characterstats (skeleton for stats and attributes)
@onready var stats : CharacterStats

#current health 
@onready var health : int = 0

#initialize character with specific stats
func _ready():
	if stats != null:
		health = stats.max_health
		
	else:
		print("No Stats Assigned")

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
		







