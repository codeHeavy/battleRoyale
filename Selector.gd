extends Sprite


var MovementCircle=[]
var MovementSpeed = 2

var SelectedGridPosition = self.position





func _process(delta):
	
	if(Input.is_key_pressed(KEY_W)):
		translate(Vector2(0,32))
	elif(Input.is_key_pressed(KEY_D)):
		translate(Vector2(32,0))
	elif(Input.is_key_pressed(KEY_ENTER)):
		SelectedGridPosition = self.position
	
	pass