extends Node

class_name CharacterSkill

var skillDescription : String
var skillCost : int
var baseDamage : int
var successChance: float

func initialize(skill : Skill):
	name = skill.skillName
	skillDescription = skill.skillDescription
	skillCost = skill.skillCost
	baseDamage = skill.baseDamage
	successChance = skill.successChance
	
