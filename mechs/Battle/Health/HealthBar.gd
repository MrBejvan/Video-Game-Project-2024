extends ProgressBar

@onready var battlerParent = get_parent()
@onready var battler_max_health = battlerParent.health_max
@onready var battler_min_health = battlerParent.health_min
@onready var battler_current_health = battlerParent.health_curr


func _process(delta):
	self.value = battler_current_health
	if battler_current_health != battler_max_health:
		self.visible = true
		if battler_current_health == battler_min_health:
			self.visible = false
	else:
		self.visible = false
		
#this function is designed to recieve a signal from the "take dmg" function and apply updates to the health bar
#note the character stats "current health" should also recieve the signal and update
func updateHealthBar():
	pass
	#if signal (connect) then barValue -= damage_recieved
	
	
