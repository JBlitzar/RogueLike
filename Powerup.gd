extends Sprite2D

var grid_position: Vector2
var tile: NavigationTile
var powerUpType: String
func _ready():
	if powerUpType == "code":
		texture = load("res://code.png")
	else:
		texture = load("res://shield.png")
	print(powerUpType)

