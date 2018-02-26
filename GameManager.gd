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
		#get_child(1).get_child(0).set_modulate(Color(1, 1, 1, 1))
		#get_child(1).get_child(1).set_modulate(Color(1, 1, 1, 1))
		#get_child(1).get_child(2).set_modulate(Color(1, 1, 1, 1))
		get_child(1).get_child(0).get_child(1).set_modulate(Color(1, 1, 1, 1))
		get_child(1).get_child(1).get_child(1).set_modulate(Color(1, 1, 1, 0))
		get_child(1).get_child(2).get_child(1).set_modulate(Color(1, 1, 1, 0))
		get_child(1).EndTurn()
		#get_child(2).get_child(0).set_modulate(Color(1, 1, 1, 1))
		#get_child(2).get_child(1).set_modulate(Color(1, 1, 1, 1))
		#get_child(2).get_child(2).set_modulate(Color(1, 1, 1, 1))
		get_child(2).get_child(0).get_child(1).set_modulate(Color(1, .5, 0, 1))
		get_child(2).get_child(1).get_child(1).set_modulate(Color(1, .5, 0, 0))
		get_child(2).get_child(2).get_child(1).set_modulate(Color(1, .5, 0, 0))
		get_child(2).EndTurn()
		#print(get_child(0).getGridPos(get_child(1).get_child(0)))
		#print(get_child(0).getGridPos(get_child(1).get_child(1)))
		#print(get_child(0).getGridPos(get_child(1).get_child(2)))
		#print(get_child(0).getGridPos(get_child(2).get_child(0)))
		#print(get_child(0).getGridPos(get_child(2).get_child(1)))
		#print(get_child(0).getGridPos(get_child(2).get_child(2)))
		turnCounter = turnCounter + 1
		if(turnCounter == 1):
			get_child(0).get_child(0).shrink()
			turnCounter = 0
	pass
	
func isColliding(playerToCheckAgainst, position): # 1 for player 1 2 for player 2, returns index of the minion or 3 for no collision
	print("collllll")
	print(position)
	print(get_child(1).get_child(0).position)
	print(get_child(2).get_child(0).position)
	if (playerToCheckAgainst == 1):
		#if (position.x <= get_child(1).get_child(0).position.x+32 && position.x+32 >= get_child(1).get_child(0).position.x
		#&& position.y <= get_child(1).get_child(0).position.y+32 && position.y+32 >= get_child(1).get_child(0).position.y): return 0
		if (position == get_child(1).get_child(0).position): return 0
		elif (position == get_child(1).get_child(1).position): return 1
		elif (position == get_child(1).get_child(2).position): return 2
		else: return 3
	else:
		if (position == get_child(2).get_child(0).position): return 0
		elif (position == get_child(2).get_child(1).position): return 1
		elif (position == get_child(2).get_child(2).position): return 2
		else: return 3
	pass
