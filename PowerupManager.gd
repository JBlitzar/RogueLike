extends Node
@export var powerupsperroom_min = 1
@export var powerupsperroom_max = 5
@export var powerupScene: PackedScene
@export var player: Node
var powerups = []
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func spawn_powerup(cell,navGrid):
	var powerupInst = powerupScene.instantiate()
	powerupInst.position = get_parent().map_to_local(Vector2i(cell.x,cell.y))
	powerupInst.grid_position = cell
	var powerUpType = randi() % 2
	if powerUpType == 1:
		powerupInst.powerUpType = "code"
	else:
		powerupInst.powerUpType = "shield"
	add_child(powerupInst)
	var tileObj = navGrid.queryTile(cell.x, cell.y)
	tileObj.entity = powerupInst
	powerupInst.tile = tileObj
	powerups.append(powerupInst)
func move_powerups(navGrid,tilemap):
	navGrid.init_astar()
	for powerup in powerups:
		if powerup != null:
			if powerup.grid_position == player.playerPos:
				player.activate_powerup(powerup.powerUpType)
				powerup.call_deferred("queue_free")
	

func generate_powerups(rooms,navGrid):
	for room in rooms:
		for i in range(randi_range(powerupsperroom_min,powerupsperroom_max)):
			var newCell = room.get_random_cell()
			spawn_powerup(newCell,navGrid)
		#pass# pick a random range of powerups in a room, put them in random positions


