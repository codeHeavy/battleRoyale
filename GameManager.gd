extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var turnCounter = 0
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	#node.position = Vector2(64,0)
	get_child(0).get_child(0).shrink()
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	get_child(1).TakeTurn(delta)
	get_child(2).TakeTurn(delta)
	if (get_child(1).timer > 15 && get_child(2).timer > 15):
		get_child(1).EndTurn()
		get_child(2).EndTurn()
		turnCounter = turnCounter + 1
	if(turnCounter == 1):
		get_child(0).get_child(0).shrink()
		turnCounter = 0
	pass