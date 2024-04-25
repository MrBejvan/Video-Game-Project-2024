extends Node

class_name CharacterStats

signal health_changed(new_health)
signal health_depleted()

var health : int
var max_health : int
var strength : int
var swift : int
var defense : int
var num_skills_available : int
var num_skill_resources : int

func initialize(stats : StartingStats):
	max_health = stats.max_health
	strength = stats.strength
	swift = stats.swift
	defense = stats.defense
	health = max_health
	
func set_max_health(value):
	max_health = max(0, value)

#add healing and damage functions below as necessary
