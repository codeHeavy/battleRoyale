extends Node2D

# Script of minion

var Health = 3
var MovementSpeed = 1
var minionTransform = get_global_transform()
var prevGridPosition 

func _ready():
	prevGridPosition = get_child(1).SelectedGridPosition
	pass

func _process(delta):
	
	# changing the position of minion to the position of the selector
	
	if(get_child(1).SelectedGridPosition != prevGridPosition):
		minionTransform.origin = minionTransform.origin.linear_interpolate(get_child(1).SelectedGridPosition, delta)
		set_global_transform(minionTransform)
		#self.global_position = get_child(1).SelectedGridPosition
		pass
