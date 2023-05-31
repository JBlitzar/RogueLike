extends Sprite2D
var speed = 16
var target: Vector2
var grid_position: Vector2
#func _ready():
#	target = position
#func _process(delta):
#	velocity = position.direction_to(target) * speed
#	move_and_slide()
#func advance_next(localX,localY):
#	target = Vector2(localX,localY)
func goto_next(astar_path,tilemap):
	#position = Vector2(3,3)
	position = tilemap.map_to_local(grid_position+Vector2(1,0))
	position = tilemap.map_to_local(Vector2(astar_path[1]))
	grid_position = Vector2(astar_path[1])
