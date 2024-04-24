extends Node

class_name Job

@onready var stats = $Stats
@onready var skills = $Skills

@export var starting_stats : StartingStats
@export var starting_skills : Array[PackedScene]

# @export var character_skill_scene : 

#....

func _ready():
	stats.initialize(starting_stats)
	if starting_skills != null and starting_skills.size() > 0:
		#var new_skill = character_skill_scene.instance()
		#new_skill.initialize(skill)
		#skills.add_child(new_skill)
		pass
