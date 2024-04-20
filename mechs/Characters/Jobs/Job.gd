extends Node

class_name Job

@onready var stats = $stats
@onready var skills = $skills

@export var starting_stats : Resource
@export var starting_skills : Array
# @export var character_skill_scene : 

#....

func _ready():
	stats.initialize(StartingStats)
	if starting_skills != null and starting_skills.size() > 0:
		#var new_skill = character_skill_scene.instance()
		#new_skill.initialize(skill)
		#skills.add_child(new_skill)
		pass
