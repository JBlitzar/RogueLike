extends CharacterBody2D
var speed = 16
var target: Vector2 = position
var grid_position: Vector2
func _ready():
	pass
func _process(delta):
	velocity = position.direction_to(target) * speed
	move_and_slide()
func advance_next(localX,localY):
	target = Vector2(localX,localY)
