extends Sprite

# Script for the selection box of each minion

var MovementCircle=[]
var MovementSpeed = 2
var SelectedGridPosition = Vector2(32,32)

var releaseCounter = 2


func _process(delta):
	
	# timer to detect one press
	releaseCounter = releaseCounter - delta
	
	if(Input.is_key_pressed(KEY_W)):
		translate(Vector2(0,-10))
	elif(Input.is_key_pressed(KEY_D)):
		translate(Vector2(10,0))
	elif(Input.is_key_pressed(KEY_A)):
		translate(Vector2(-10,0))
	elif(Input.is_key_pressed(KEY_S)):
		translate(Vector2(0,10))
	# On pressing enter the current position is selected
	elif(Input.is_key_pressed(KEY_ENTER) && releaseCounter < 0):
		releaseCounter=2
		SelectedGridPosition = self.global_position
	
	pass