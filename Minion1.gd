extends Node


var Health = 3
var MovementSpeed = 1

var CurrentGridPosition = Vector2(0,0)

func _ready():
	pass

func _process(delta):
	position = get_child(1).position
	pass
