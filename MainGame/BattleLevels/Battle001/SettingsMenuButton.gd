extends Button

var settings_menu_container : VBoxContainer
var sound_button : Button
var difficulty_button : Button
var foo_button : Button


func _ready():
	#button container
	settings_menu_container = $VBoxContainer
	settings_menu_container.visible = false
	
	#sound button
	sound_button = Button.new()
	sound_button.text = "Sound"
	sound_button.size_flags_vertical = Control.SIZE_EXPAND_FILL
	sound_button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	sound_button.connect("pressed", Callable(self, "_on_sound_pressed"))
	sound_button.add_child(sound_button)
	
	#difficulty button
	difficulty_button = Button.new()
	difficulty_button.text = "Difficulty"
	difficulty_button.size_flags_vertical = Control.SIZE_EXPAND_FILL
	difficulty_button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	difficulty_button.connect("pressed", Callable(self, "_on_sound_pressed"))
	difficulty_button.add_child(difficulty_button)
	
	#foo button
	foo_button = Button.new()
	foo_button.text = "Foo"
	foo_button.size_flags_vertical = Control.SIZE_EXPAND_FILL
	foo_button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	foo_button.connect("pressed", Callable(self, "_on_sound_pressed"))
	foo_button.add_child(foo_button)
	
	#settings button pressed functionality
	
	#connect signal for actions menu
	self.connect("pressed", Callable(self, "on_settings_menu_pressed"))

func on_settings_menu_pressed():
	settings_menu_container.visible = !settings_menu_container.visible
	

