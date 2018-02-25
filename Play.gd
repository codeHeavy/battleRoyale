extends TextureButton

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	connect("pressed",self,"_on_pressed")
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	

func _on_pressed():
	get_tree().change_scene("res://World.tscn")
	pass

func _process(delta):
	
	
	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	pass
