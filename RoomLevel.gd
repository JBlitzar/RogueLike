extends TileMap

var roomAmt = 10
var roomSizeMin = 5
var roomSizeMax = 10
var roomWMax = 50
var roomHMax = 50
var rooms = []
var tiles = []
var grid = []
var gridObject
var turn = "player"
# Called when the node enters the scene tree for the first time.
func add_tiles(tilesToAdd):
	for tile in tilesToAdd:
		add_tile(tile)
func add_tile(tile):
	for checktile in tiles:
		if checktile.comparepos(tile):
			checktile.contents = tile.contents
			checktile.atlasSprite = tile.atlasSprite
			
			return
	tiles.append(tile)
func _ready():
	var rng = RandomNumberGenerator.new()
	rng.set_seed(Time.get_ticks_usec())
	for i in range(roomAmt):
		var x = rng.randi_range(0,roomWMax)
		var y = rng.randi_range(0,roomHMax)
		var w = rng.randi_range(roomSizeMin,roomSizeMax)
		var h = rng.randi_range(roomSizeMin,roomSizeMax)
		var room = Room.new(x,y,w,h)
		if room.check_collide_rooms(rooms):
			pass
		else:
			rooms.append(room)
			room.spawn()
			add_tiles(room.tiles)
	for room in rooms:
		var passage = room.connect_room(room.get_closest_unconnected_room(rooms))
		if passage:
			passage.spawn()
			add_tiles(passage.tiles)
	gridObject = NavigationGrid.new(self,tiles)
	gridObject.renderTiles()
	$Player.position = map_to_local(Vector2(rooms[0].get_center()[0],rooms[0].get_center()[1]))
	$Player.playerPos = Vector2(rooms[0].get_center()[0],rooms[0].get_center()[1])
	
	
	gridObject.init_astar()
	$EnemyManager.generate_enemies(rooms,gridObject)
	
	#var startEx = gridObject.queryTile(rooms[0].get_center()[0],rooms[0].get_center()[1])
	#var endEx = gridObject.queryTile(rooms[1].get_center()[0],rooms[1].get_center()[1])
	#print(gridObject.astar_path(startEx,endEx))
	#print("hullo")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func advanceEnemies():
	$EnemyManager.move_enemies(gridObject,self)

func _on_player_input_recieved(playerPos,playerVel):
	pass # Replace with function body.
