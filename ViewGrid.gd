extends Node2D
onready var grid = get_parent()
# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var node1
var node2
var node3
var node4
var crowd

var xStart = -1
var xEnd = 30
var yStart = -1
var yEnd = 17

var currentBoundryXStart
var currentBoundryXEnd
var currentBoundryYStart
var currentBoundryYEnd

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	crowd = load("res://crowd.tscn")
	pass
func _draw():
	var LINECOLOR = Color(255,0,0)
	var LINEWIDTH = 2
	var window_size = OS.get_window_size()
	#generateCrowd()
	for x in range(grid.gridSize.x + 1):
		var colPos = x * grid.tileSize.x
		var limit = grid.gridSize.y * grid.tileSize.y
		draw_line(Vector2(colPos,0),Vector2(colPos,limit),LINECOLOR,LINEWIDTH)
		for y in range(grid.gridSize.y + 1):
			var rowPos = y * grid.tileSize.y
			var limitR = grid.gridSize.x * grid.tileSize.y
			draw_line(Vector2(0,rowPos),Vector2(limit,rowPos),LINECOLOR,LINEWIDTH)
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	# player1 minions
	var p1_m1_pos = get_parent().get_parent().get_child(1).get_child(0).position
	var p1_m1 = get_parent().get_parent().get_child(1).get_child(0)
	
	var p1_m2_pos = get_parent().get_parent().get_child(1).get_child(1).position
	var p1_m2 = get_parent().get_parent().get_child(1).get_child(1)
	
	var p1_m3_pos = get_parent().get_parent().get_child(1).get_child(2).position
	var p1_m3 = get_parent().get_parent().get_child(1).get_child(2)
	#print(m1_pos.x, " ", m1_pos.y)
	#print(currentBoundryXStart," ",currentBoundryXEnd," ",currentBoundryYStart," ",currentBoundryYEnd,"")
	if(p1_m1_pos.x <= currentBoundryXStart or p1_m1_pos.x >= currentBoundryXEnd or p1_m1_pos.y <= currentBoundryYStart or p1_m1_pos.y >= currentBoundryYEnd):
		p1_m1.take_damage()
	if(p1_m2_pos.x <= currentBoundryXStart or p1_m2_pos.x >= currentBoundryXEnd or p1_m2_pos.y <= currentBoundryYStart or p1_m2_pos.y >= currentBoundryYEnd):
		p1_m2.take_damage()
	if(p1_m3_pos.x <= currentBoundryXStart or p1_m3_pos.x >= currentBoundryXEnd or p1_m3_pos.y <= currentBoundryYStart or p1_m3_pos.y >= currentBoundryYEnd):
		p1_m3.take_damage()
		
	var p2_m1_pos = get_parent().get_parent().get_child(2).get_child(0).position
	var p2_m1 = get_parent().get_parent().get_child(2).get_child(0)
	
	var p2_m2_pos = get_parent().get_parent().get_child(2).get_child(1).position
	var p2_m2 = get_parent().get_parent().get_child(2).get_child(1)
	
	var p2_m3_pos = get_parent().get_parent().get_child(2).get_child(2).position
	var p2_m3 = get_parent().get_parent().get_child(2).get_child(2)
	#print(m1_pos.x, " ", m1_pos.y)
	#print(currentBoundryXStart," ",currentBoundryXEnd," ",currentBoundryYStart," ",currentBoundryYEnd,"")
	if(p2_m1_pos.x <= currentBoundryXStart or p2_m1_pos.x >= currentBoundryXEnd or p2_m1_pos.y <= currentBoundryYStart or p2_m1_pos.y >= currentBoundryYEnd):
		p1_m1.take_damage()
	if(p2_m2_pos.x <= currentBoundryXStart or p2_m2_pos.x >= currentBoundryXEnd or p2_m2_pos.y <= currentBoundryYStart or p2_m2_pos.y >= currentBoundryYEnd):
		p2_m2.take_damage()
	if(p2_m3_pos.x <= currentBoundryXStart or p2_m3_pos.x >= currentBoundryXEnd or p2_m3_pos.y <= currentBoundryYStart or p2_m3_pos.y >= currentBoundryYEnd):
		p2_m3.take_damage()
	pass

func shrink():
	xStart = xStart + 1;
	xEnd = xEnd - 1;
	yStart = yStart + 1;
	yEnd = yEnd - 1;
	for x in range(grid.gridSize.x + 1):
		var colPos = x * grid.tileSize.x
		var limit = grid.gridSize.y * grid.tileSize.y
		for y in range(grid.gridSize.y + 1):
			var rowPos = y * grid.tileSize.y
			var limitR = grid.gridSize.x * grid.tileSize.y
			node1 = crowd.instance()
			node2 = crowd.instance()
			node3 = crowd.instance()
			node4 = crowd.instance()
			add_child(node1)
			add_child(node2)
			add_child(node3)
			add_child(node4)
			node1.position = (Vector2(xStart * 64, colPos))
			node2.position = (Vector2((xEnd)* 64, colPos))
			node3.position = (Vector2(rowPos , yStart * 64))
			node4.position = (Vector2(colPos, (yEnd) * 64))
			currentBoundryXStart = xStart * 64
			currentBoundryXEnd	= xEnd * 64
			currentBoundryYStart = yStart *64
			currentBoundryYEnd = yEnd * 64
			#print(rowPos," " , colPos)
	pass