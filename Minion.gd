extends Node2D

# Script of minion

var Health = 3
var MovementSpeed = 1
var minionTransform 
var prevGridPosition 

func _ready():
	minionTransform = get_global_transform()
	prevGridPosition = get_child(1).SelectedGridPosition
	pass

func _process(delta):
	
	
	# changing the position of minion to the position of the selector with linear interpolate
	if(get_child(1).SelectedGridPosition != prevGridPosition):
		minionTransform.origin = minionTransform.origin.linear_interpolate(get_child(1).SelectedGridPosition, 2*delta)
		set_global_transform(minionTransform)
		#get_child(1).hide()
	#else:
		#get_child(1).show()
	
		
	pass
