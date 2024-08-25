extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	var findPositions = $FindCharPositions
	
	#findPositions.findCharacterNodes()
	findPositions.addCharNodesDict()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
