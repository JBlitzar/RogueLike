extends TileMap

var roomAmt = 10
var roomSizeMin = 5
var roomSizeMax = 10
var roomWMax = 50
var roomHMax = 50
var rooms = []
var tiles = []
# Called when the node enters the scene tree for the first time.
func add_tiles(tilesToAdd):
	for tile in tilesToAdd:
		add_tile(tile)
func add_tile(tile):
	for checktile in tiles:
		if checktile.comparepos(tile):
			checktile.tileContents = tile.tileContents
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
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
