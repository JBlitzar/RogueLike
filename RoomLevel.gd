extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	#set_cell( 0, Vector2i(0,0), 0, Vector2i(0, 0))
	var myRoom = Room.new(5,10,12,16)
	myRoom.render(self)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
