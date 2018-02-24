extends Sprite

# Script for the selection box of each minion

var MovementCircle=[]
var MovementSpeed = 2
onready var map = get_node("/root/World/TileMap")

var SelectedGridPosition =  map.map_to_world(Vector2(1,1))

var releaseCounter = 0.5


func _process(delta):
	
	# timer to detect one press
	releaseCounter = releaseCounter - delta
	
	if(Input.is_key_pressed(KEY_W)):
		translate(Vector2(0,-32))
	elif(Input.is_key_pressed(KEY_D)):
		translate(Vector2(32,0))
	elif(Input.is_key_pressed(KEY_A)):
		translate(Vector2(-32,0))
	elif(Input.is_key_pressed(KEY_S)):
		translate(Vector2(0,32))
	# On pressing enter the current position is selected
	elif(Input.is_key_pressed(KEY_ENTER) && releaseCounter < 0):
		releaseCounter=0.5
		SelectedGridPosition = self.global_position
	
	pass