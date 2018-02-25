extends TileMap
var tileSize = get_cell_size()
var halfTileSize = tileSize / 2

var gridSize = Vector2(30,30)
var grid = []

enum OBJECTS {Player1, Player2, Pickups}

func _ready():
	#print(tileSize)
	for x in range(tileSize.x):
		grid.append([])
		for y in range(tileSize.y):
			grid[x].append(null)
	pass

func isVacant(pos,direction):
	var gridPos = world_to_map(pos) + direction
	
	if gridPos.x < gridSize.x and gridPos.x >= 0:
		if gridPos.y < gridSize.y and gridPos.y >= 0:
			if grid[gridPos.x][gridPos.y] == null:
				return true
			else:
				return false
	return false

# returns new position to move the selector
# and updates the grid values to reflect the same
func updateChildPos(childNode):
	var gridPos = world_to_map(childNode.position)
	#print(gridPos)
	# set previos cell to empty
	grid[gridPos.x][gridPos.y] = null
	
	# set the player to the new grid position
	var newPos = gridPos + childNode.direction
	grid[newPos.x][newPos.y] = Player1
	
	# position for actual movement
	var newTargetPosition = map_to_world(newPos)
	return newTargetPosition

func getGridPos(childNode):
	return world_to_map(childNode.position)
