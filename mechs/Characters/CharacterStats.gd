extends Node

class_name CharacterStats

signal health_changed(new_health)
signal health_depleted()

var job_name : String
var max_health : int
var health : int
var strength : int
var swift : int
var defense : int
var num_skills_available : int
var num_skill_resources : int

func initialize(stats : StartingStats):
	job_name = stats.job_name
	max_health = stats.max_health
	health = stats.health
	strength = stats.strength
	swift = stats.swift
	defense = stats.defense
	num_skills_available = num_skills_available
	num_skill_resources = num_skill_resources
	
func set_max_health(value):
	max_health = max(0, value)

#add healing and damage functions below as necessary
