extends RefCounted
class_name Room
var x
var y
var width
var height
func _init(x, y, width, height):
	self.x = x
	self.y = y
	self.width = width
	self.height = height
func render(tilemap):
	for i in range(x, width+x):
		for j in range(y, height+y):
			tilemap.set_cell(0, Vector2i(i,j), 0, Vector2i(0, 0))

func check_collide(room):
	if self.x < room.x + room.width and self.x + self.width > room.x and self.y < room.y + room.height and self.height + self.y > room.y:
		return true
	return false
