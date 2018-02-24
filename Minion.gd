extends Node2D


var Health = 3
var MovementSpeed = 1

var CurrentGridPosition = Vector2(0,0)

func _ready():
	pass

func _process(delta):
	self.global_position = get_child(1).SelectedGridPosition
	pass
