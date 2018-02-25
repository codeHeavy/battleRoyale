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
var releaseCounter = 0.3
var timeLimit = 0.3

var SelectedGridPosition = Vector2()

func _ready():
	grid = get_tree().get_root().get_node("World").get_child(0)
	#print(get_tree().get_root().get_node("World").get_child(0))
	var startPos = grid.updateChildPos(self)
	self.position = startPos
	SelectedGridPosition = self.global_position
	pass

func _physics_process(delta):
	# timer to detect one press
	releaseCounter = releaseCounter - delta
	if(releaseCounter < 0):
		var isMoving = false
		if(Input.is_key_pressed(KEY_W) or Input.is_key_pressed(KEY_S) or Input.is_key_pressed(KEY_A) or Input.is_key_pressed(KEY_D) ):
			isMoving = true
		direction = Vector2()
		if isMoving:
			if (Input.is_key_pressed(KEY_W)):
				direction = TOP
			elif (Input.is_key_pressed(KEY_S)):
				direction = DOWN
			elif (Input.is_key_pressed(KEY_A)):
				direction = LEFT
			elif (Input.is_key_pressed(KEY_D)):
				direction = RIGHT
		if(Input.is_key_pressed(KEY_ENTER)):
			SelectedGridPosition = self.position
			print(SelectedGridPosition)

		var targetPos = grid.updateChildPos(self)
		if(isMovable(direction)):
			self.position = targetPos
			releaseCounter = timeLimit
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