extends Node
@export var enemiesperroom_min = 1
@export var enemiesperroom_max = 5
@export var enemyScene: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func spawn_enemy(cell,navGrid):
	var enemyInst = enemyScene.instantiate()
	#enemyInst.position = 
	add_child(enemyInst)
	var tileObj = navGrid.queryTile(cell.x, cell.y)
	tileObj.entity = enemyInst

func generate_enemies(rooms,navGrid):
	for room in rooms:
		for i in range(randi_range(enemiesperroom_min,enemiesperroom_max)):
			var newCell = room.get_random_cell()
			spawn_enemy(newCell,navGrid)
		#pass# pick a random range of enemies in a room, put them in random positions
