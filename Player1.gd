extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var timer = 0;

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	#get_child(0).get_child(1).hide();
	pass

func TakeTurn(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	timer = timer + delta*.0001
	#print(timer)
	if (timer < 5):
		get_child(0).get_child(1).WaitForAction(delta)
		if (get_child(0).get_child(1).selectedAction != 0):
			print("cycle to 2")
			if (get_child(0).get_child(1).selectedAction == 1):
				get_parent().p1minion0 = get_parent().p1minion0 + get_child(0).get_child(1).SelectedGridPosition
			timer = 5;
	elif (timer < 10):
		get_child(1).get_child(1).WaitForAction(delta)
		if (get_child(1).get_child(1).selectedAction != 0):
<<<<<<< HEAD:Player1.gd
			print("cycle to 3")
			if (get_child(1).get_child(1).selectedAction == 1):
				get_parent().p1minion1 = get_parent().p1minion0 + get_child(1).get_child(1).SelectedGridPosition
=======
			#print("cycle to 3")
>>>>>>> 891762ca243cac4c09d7747d6dd67af5945d8334:Player.gd
			timer = 10;
	elif (timer < 15):
		get_child(2).get_child(1).WaitForAction(delta)
		if (get_child(2).get_child(1).selectedAction != 0):
<<<<<<< HEAD:Player1.gd
			print("cycle to 1")
			if (get_child(2).get_child(1).selectedAction == 1):
				get_parent().p1minion2 = get_parent().p1minion0 + get_child(2).get_child(1).SelectedGridPosition
			timer = 15;
	#else:
=======
			#print("cycle to 1")
			timer = 15;
	else:
		pass
>>>>>>> 891762ca243cac4c09d7747d6dd67af5945d8334:Player.gd
		#print("no input")
	pass
	
func EndTurn():
	get_child(0).get_child(1).TakeAction()
	get_child(0).get_child(1).selectedAction = 0
	
	get_child(1).get_child(1).TakeAction()
	get_child(1).get_child(1).selectedAction = 0
	
	get_child(2).get_child(1).TakeAction()
	get_child(2).get_child(1).selectedAction = 0
	
	timer = 0;
	pass
