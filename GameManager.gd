extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
<<<<<<< HEAD
var p1minion0 = Vector2(0,0)
var p1minion1 = Vector2(0,0)
var p1minion2 = Vector2(0,0)
var p2minion0 = Vector2(0,0)
var p2minion1 = Vector2(0,0)
var p2minion2 = Vector2(0,0)

=======
var turnCounter = 0
>>>>>>> 891762ca243cac4c09d7747d6dd67af5945d8334
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
<<<<<<< HEAD
		#print(get_child(0).getGridPos(get_child(1).get_child(0)))
		#print(get_child(0).getGridPos(get_child(1).get_child(1)))
		#print(get_child(0).getGridPos(get_child(1).get_child(2)))
		#print(get_child(0).getGridPos(get_child(2).get_child(0)))
		#print(get_child(0).getGridPos(get_child(2).get_child(1)))
		#print(get_child(0).getGridPos(get_child(2).get_child(2)))
	pass
	
func isColliding(playerToCheckAgainst, position): # 1 for player 1 2 for player 2, returns index of the minion or 3 for no collision
	print("collllll")
	print(position)
	print(p1minion2)
	print(p2minion2)
	if (playerToCheckAgainst == 1):
		#if (position.x <= get_child(1).get_child(0).position.x+32 && position.x+32 >= get_child(1).get_child(0).position.x
		#&& position.y <= get_child(1).get_child(0).position.y+32 && position.y+32 >= get_child(1).get_child(0).position.y): return 0
		if (position == p1minion0): return 0
		elif (position == p1minion1): return 1
		elif (position == p1minion2): return 2
		else: return 3
	else:
		if (position == p2minion0): return 0
		elif (position == p2minion1): return 1
		elif (position == p2minion2): return 2
		else: return 3
	pass
=======
		turnCounter = turnCounter + 1
	if(turnCounter == 1):
		get_child(0).get_child(0).shrink()
		turnCounter = 0
	pass
>>>>>>> 891762ca243cac4c09d7747d6dd67af5945d8334
