extends CharacterBody2D

const STARTING_STATS = "res://mechs/Character/starting_stats.gd"
const EXP_VALUE := 1

#how do I connect the starting stat to the character script?

const characterName := "Enemy Goblin"


#temp - stats

var max_health := 10

var strength := 2

var swift := 3

var defense := 1




#attacks -> where does the "math" happen?

func goblinAttackValue():
	return randi() % 3










