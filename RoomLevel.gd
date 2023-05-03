extends TileMap

var roomAmt = 10
var roomSizeMin = 3
var roomSizeMax = 15
var roomWMax = 50
var roomHMax = 50
var rooms = []
# Called when the node enters the scene tree for the first time.
func _ready():
	var rng = RandomNumberGenerator.new()
	rng.set_seed(100)
	for i in range(roomAmt):
		var x = rng.randi_range(0,roomWMax)
		var y = rng.randi_range(0,roomHMax)
		var w = rng.randi_range(roomSizeMin,roomSizeMax)
		var h = rng.randi_range(roomSizeMin,roomSizeMax)
		var room = Room.new(x,y,w,h,rooms)
		rooms.append(room)
		room.render(self)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
