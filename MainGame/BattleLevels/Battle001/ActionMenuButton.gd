extends Button

signal targetselect

var action_menu_container : VBoxContainer
var attack_button : Button
var skill_button : Button

func _ready():
	#button container
	action_menu_container = $VBoxContainer
	action_menu_container.visible = false
	
	#attack button
	attack_button = Button.new()
	attack_button.text = "Attack"
	attack_button.size_flags_vertical = Control.SIZE_EXPAND_FILL
	attack_button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	attack_button.connect("pressed", Callable(self, "_on_attack_pressed"))
	
	action_menu_container.add_child(attack_button)

	#skill button
	skill_button = Button.new()
	skill_button.text = "Skill"
	skill_button.connect("pressed", Callable(self, "_on_skill_pressed"))
	action_menu_container.add_child(skill_button)
	
	#connect signal for actions menu
	self.connect("pressed", Callable(self, "on_action_menu_pressed"))

func on_action_menu_pressed():
	action_menu_container.visible = !action_menu_container.visible

func _on_attack_pressed():
	emit_signal("targetselect")
	
'''
# Called when the node enters the scene tree for the first time.
func _ready():
	var attack = Button.new()
	attack.text = "Attack"
	attack.pressed.connect(self._button_pressed)
	
	var skill = Button.new()
	skill.text = "Skill"
	skill.pressed.connect(self._button_pressed)
	
	var actionBox = VBoxContainer.new()
	actionBox.add_child(attack)
	actionBox.add_child(skill)
	add_child(actionBox)

	
func _button_pressed():
	var button_text = $PopupMenu.get_item_id()
	
	print(button_text)
	
	if button_text == "Attack":
		#send attack signal
		pass
	elif button_text == "Skill":
		#send skill signal
		pass
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func attack(target):
	pass
	
	
	
'''
