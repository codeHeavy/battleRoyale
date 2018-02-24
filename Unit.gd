extends KinematicBody2

enum PowerUp {none, A, B, C} # can be taken from script of weapons whoever makes them
# none: no powerup equippped
# A: ?
# B: ?
# C: ?

# Unit attributes
var HP = 3
var speed = 1
var isDefending = false

# Visible in inspector for debug
export (PowerUp) var currentPowerUp


func _ready():
	pass

func _process(delta):
	if currentPowerUp == PowerUp.none:	
		# default values
		speed = 1
	elif currentPowerUp == PowerUp.A:
		# assign parameters of type A power up
		pass
	elif currentPowerUp == PowerUp.B:
		# assign parameters of type B power up
		pass
	elif currentPowerUp == PowerUp.C:
		# assign parameters of type C power up
		pass

func move():
	# do movement according to speed here
	pass

func attack(target):
	pass
	
func take_damage():
	pass