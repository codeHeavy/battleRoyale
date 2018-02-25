extends Sprite
var direction = Vector2()

const TOP = Vector2(0,-1)
const RIGHT = Vector2(1,0)
const DOWN = Vector2(0,1)
const LEFT = Vector2(-1,0)

# speed indicates number of cells to move from the character
var speed = 1
const MAXSPEED = 400
var velocity = Vector2()

var grid
var releaseCounter = 0.13
var timeLimit = 0.13

var SelectedGridPosition = Vector2()
var inputTaken = false
# Move is 1, attack is 2
var selectedAction = 0;

func _ready():
	grid = get_tree().get_root().get_node("World").get_child(0)
	#print(get_tree().get_root().get_node("World").get_child(0))
	var startPos = grid.updateChildPos(self)
	self.position = startPos
	SelectedGridPosition = self.global_position
	pass

func WaitForAction(delta):
	# timer to detect one press
	releaseCounter = releaseCounter - delta
	if(selectedAction == 0):
		if(releaseCounter < 0):
			var isMoving = false
			if(Input.is_key_pressed(KEY_I) or Input.is_key_pressed(KEY_K) or Input.is_key_pressed(KEY_J) or Input.is_key_pressed(KEY_L) ):
				isMoving = true
				inputTaken = true
			direction = Vector2()
			if isMoving:
				if (Input.is_key_pressed(KEY_I)):
					direction = TOP
				elif (Input.is_key_pressed(KEY_K)):
					direction = DOWN
				elif (Input.is_key_pressed(KEY_J)):
					direction = LEFT
				elif (Input.is_key_pressed(KEY_L)):
					direction = RIGHT
			var targetPos = grid.updateChildPos(self)
			if(isMovable(direction)):
				self.position = targetPos
				releaseCounter = timeLimit
			if(Input.is_key_pressed(KEY_PERIOD) && inputTaken):
				selectedAction = 1; # Move
				inputTaken = false
				print(SelectedGridPosition)
		
	if(selectedAction == 1):
		SelectedGridPosition = self.position
		releaseCounter = timeLimit
		#self.show();
		#if(selectedAction == 2):
			#if(self.getov):
				#var attackee = ;
		# debug prints
		# print("chara : ",get_parent().get_child(0).position)
		# print("sele : ",self.position)
	pass

# Limits the motion of the selector depending on the speed
func isMovable(dir):
	var currentCharacterGridPos = grid.getGridPos(get_parent().get_child(0))
	var currentGridPos = grid.getGridPos(self)
	var newPos = currentGridPos + dir
	var dx = abs(newPos.x-currentCharacterGridPos.x)
	var dy = abs(newPos.y-currentCharacterGridPos.y)
	if(dx > speed or dy > speed):
		return false
	return true 