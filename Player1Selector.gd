extends KinematicBody2D
var direction = Vector2()

const TOP = Vector2(0,-1)
const RIGHT = Vector2(1,0)
const DOWN = Vector2(0,1)
const LEFT = Vector2(-1,0)

var speed = 0
const MAXSPEED = 400
var velocity = Vector2()

var grid

func _ready():
	grid = get_parent()
	pass

func _physics_process(delta):
	var isMoving = false
	if(Input.is_key_pressed(KEY_W) or Input.is_key_pressed(KEY_S) or Input.is_key_pressed(KEY_A) or Input.is_key_pressed(KEY_D) ):
		isMoving = true
	direction = Vector2()
	if isMoving:
		speed = MAXSPEED
		if (Input.is_key_pressed(KEY_W)):
			direction = TOP
		elif (Input.is_key_pressed(KEY_S)):
			direction = DOWN
		elif (Input.is_key_pressed(KEY_A)):
			direction = LEFT
		elif (Input.is_key_pressed(KEY_D)):
			direction = RIGHT
	else:
		speed = 0
	
	# dont scale by deltaTime if using move_and_slide
	velocity = speed * direction.normalized()
	move_and_slide(velocity)
	
	print(get_global_position())
	#var targetPos = grid.updateCildPos(self)
	#translate(targetPos)
	#move_and_collide(targetPos)
	pass
