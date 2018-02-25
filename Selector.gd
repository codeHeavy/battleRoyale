extends Sprite

# Script for the selection box of each minion

var MovementCircle=[]
var MovementSpeed = 2
var SelectedGridPosition = Vector2(32,32)

var releaseCounter = 0
var timeLimit = 0.3

func _process(delta):
	
	# timer to detect one press
	releaseCounter = releaseCounter - delta
	
	if(releaseCounter < 0):
		if(Input.is_key_pressed(KEY_W)):
			self.position = self.position + Vector2(0,-64)
			releaseCounter=timeLimit
		elif(Input.is_key_pressed(KEY_D)):
			self.position = self.position + Vector2(64,0)
			releaseCounter=timeLimit
		elif(Input.is_key_pressed(KEY_A)):
			self.position = self.position + Vector2(-64,0)
			releaseCounter=timeLimit
		elif(Input.is_key_pressed(KEY_S)):
			self.position = self.position + Vector2(0,64)
			releaseCounter=timeLimit
		# On pressing enter the current position is selected
		elif(Input.is_key_pressed(KEY_ENTER)):
			SelectedGridPosition = self.global_position
			releaseCounter=timeLimit
	
	pass