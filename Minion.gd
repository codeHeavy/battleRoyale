extends Node2D

# Script of minion

var Health = 3
var MovementSpeed = 1


func _ready():
	pass

func _process(delta):
	
	# changing the position of minion to the position of the selector
	self.global_position = get_child(1).SelectedGridPosition
	pass
