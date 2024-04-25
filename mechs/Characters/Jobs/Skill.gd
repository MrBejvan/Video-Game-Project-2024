extends Resource

#resource method allows for custom skills to be created as resource files and applied to the class structure as was done in with character stats

class_name Skill

@export var skillName := "Skill"
@export var skillDescription := ""


@export var skillCost : int
@export var baseDamage : int
@export var successChance : float
