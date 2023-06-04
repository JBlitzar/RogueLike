extends Node
@export var enemiesperroom_min = 1
@export var enemiesperroom_max = 5
@export var enemyScene: PackedScene
@export var player: Node
var enemies = []
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func spawn_enemy(cell,navGrid):
	var enemyInst = enemyScene.instantiate()
	enemyInst.position = get_parent().map_to_local(Vector2i(cell.x,cell.y))
	enemyInst.grid_position = cell
	add_child(enemyInst)
	var tileObj = navGrid.queryTile(cell.x, cell.y)
	tileObj.entity = enemyInst
	enemyInst.tile = tileObj
	enemies.append(enemyInst)
func move_enemies(navGrid,tilemap):
	navGrid.init_astar()
	for enemy in enemies:
		if enemy != null:
			var enemyRoom = navGrid.query_point_to_room(enemy.grid_position,tilemap.rooms)
			var playerRoom = navGrid.query_point_to_room(player.playerPos,tilemap.rooms)
			if enemyRoom and playerRoom:
				if enemyRoom == playerRoom:
					enemy.aggro()
					print("mad")
			if enemy.aggrod:
				var path = navGrid.astar_path(navGrid.queryTile(enemy.grid_position.x,enemy.grid_position.y),navGrid.queryTile(player.playerPos.x,player.playerPos.y))
				print(path, enemy.grid_position)
				if Array(path) != []:
					enemy.goto_next(path,tilemap)
	

func generate_enemies(rooms,navGrid):
	for room in rooms:
		for i in range(randi_range(enemiesperroom_min,enemiesperroom_max)):
			var newCell = room.get_random_cell()
			spawn_enemy(newCell,navGrid)
		#pass# pick a random range of enemies in a room, put them in random positions
func damage_player():
	player.damage()
