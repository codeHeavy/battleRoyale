extends Node2D
onready var grid = get_parent()
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
func _draw():
	var LINECOLOR = Color(255,0,0)
	var LINEWIDTH = 2
	var window_size = OS.get_window_size()
	
	for x in range(grid.gridSize.x + 1):
		var colPos = x * grid.tileSize.x
		var limit = grid.gridSize.y * grid.tileSize.y
		draw_line(Vector2(colPos,0),Vector2(colPos,limit),LINECOLOR,LINEWIDTH)
		for y in range(grid.gridSize.y + 1):
			var rowPos = y * grid.tileSize.y
			var limitR = grid.gridSize.x * grid.tileSize.y
			draw_line(Vector2(0,rowPos),Vector2(limit,rowPos),LINECOLOR,LINEWIDTH)
	pass
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
