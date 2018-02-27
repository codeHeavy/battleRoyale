extends Node2D

# Script of minion

var Health = 3
var MovementSpeed = 1
var attackRange = 1
var minionTransform
var characterObject 
var prevGridPosition 
var notDead = 1

var pickups
func _ready():
	minionTransform = get_global_transform()
	characterObject = get_child(0)
	prevGridPosition = get_child(1).SelectedGridPosition
	pickups = get_parent().get_parent().get_child(3)
	pass

func _process(delta):
	
	# abstracted Move works with player1selector script
	#move(delta)
	
	# comment out below if using move function
	# changing the position of minion to the position of the selector with linear interpolate
	#if(get_child(1).SelectedGridPosition != prevGridPosition):
		#minionTransform.origin = minionTransform.origin.linear_interpolate(get_child(1).SelectedGridPosition - Vector2(32,32), 2*delta)
		#set_global_transform(minionTransform)
		#get_child(1).hide()
	#else:
		#get_child(1).show()
	# pickups hack :p
	for i in range(0,6):
		if(self.position == pickups.get_child(i).position):
			pickups.get_child(i).hide()
	pass


func move():
	var offset = Vector2(0.5,0.5)
	if(get_child(1).SelectedGridPosition != prevGridPosition):
		#characterObject.position = characterObject.position.linear_interpolate(get_child(1).SelectedGridPosition + offset, 1)
		print("old: ")
		print(self.position)
		self.position = self.position + get_child(1).SelectedGridPosition
		print("new: ")
		print(self.position)
		get_child(1).position = Vector2(0, 0)
		# To hide the selector
		# get_child(1).hide()
	else:
		get_child(1).show()
	pass
	
func attack(target):
	# call take_damage from Minion in selected target for attack
	# get overlapping 
	pass

# call when the unit is attacked by another player's unit	
func take_damage():
	# when attacked, take damage accordingly
	Health = Health - 1;
	if (Health == 2): get_child(0).set_modulate(Color(.7, .3, .3, 1))
	elif (Health == 1): get_child(0).set_modulate(Color(1, 0, 0, 1))
	else: 
		notDead = 0
		self.set_modulate(Color(0, 0, 0, 0))
	#print("sad")
	# acccount for defending-  EXTRA
	pass

# call when the unit comes in contact with a powerup, applies the movementSpeed  and attackRange of the powerup to this Minion 	
func apply_powerup(powerup):
	MovementSpeed = powerup.MovementSpeed
	attackRange = powerup.attackRange
	
