@tool
extends Node

class_name Job

#grab and get these ready before executing anything else
@onready var stats = get_node("Stats")
@onready var skills = get_node("Skills")
@export var starting_stats : StartingStats

#add skills when appropriate
@export var starting_skills : Array
@export var character_skill_scene : PackedScene

#....

func _ready():
	print("Job node: ", self.get_path())
	print("Stats node: ", stats.get_path())
	print("Skills node: ", skills.get_path())
	print("Starting stats: ", starting_stats)
	print("Starting skills: ", starting_skills)
	
	#sanity check for stats initialization
	if (stats):
		stats.initialize(starting_stats)
		print("Stats initialized")
		
	#sanity check for skills initialization	
	if starting_skills != null and starting_skills.size() > 0:
		for skill in starting_skills:	
			var new_skill = character_skill_scene.instance()
			new_skill.initialize(skill)
			skills.add_child(new_skill)
	else:
		print("No Skills in starting_skills[]")
		pass	
