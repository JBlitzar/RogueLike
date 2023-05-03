extends RefCounted
class_name Room
var x
var y
var width
var height
func _init(x, y, width, height,rooms):
	self.x = x
	self.y = y
	self.width = width
	self.height = height
	for room in rooms:
		if check_collide(room):
			print("collision")
func get_center():
	return [(self.x+self.width/2),(self.y+self.height/2)]
func manhattan_dist(otherRoom):
	#dx+dy
	return abs(otherRoom.get_center()[0]-self.get_center()[0])+abs(otherRoom.get_center()[1]-self.get_center()[1])
func render(tilemap):
	for i in range(x, width+x):
		for j in range(y, height+y):
			tilemap.set_cell(0, Vector2i(i,j), 0, Vector2i(0, 0))

func check_collide(room):
	if self.x < room.x + room.width and self.x + self.width > room.x and self.y < room.y + room.height and self.height + self.y > room.y:
		return true
	return false
func get_closest_room(rooms):
	var closestDist = 9999999
	var closestRoom = null
	for room in rooms:
		if manhattan_dist(room) < closestDist:
			closestRoom = room
			closestDist = manhattan_dist(room)
	return closestRoom


