extends Sprite


var MovementCircle=[]
var MovementSpeed = 2

var SelectedGridPosition = get_position_in_parent()





func _process(delta):
	
	if(Input.is_key_pressed("W")):
		move_local_y(32)
	elif(Input.is_key_pressed("D")):
		move_local_x(32)
	elif(Input.is_key_pressed(KEY_ENTER)):
		SelectedGridPosition = get_global_transform_with_canvas()
	
	pass