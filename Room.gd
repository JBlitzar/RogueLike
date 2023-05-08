extends RefCounted
class_name Room
var x
var y
var width
var height
var connections = []
func _init(x, y, width, height):
	self.x = x
	self.y = y
	self.width = width
	self.height = height
func get_center():
	return [(self.x+self.width/2),(self.y+self.height/2)]
func manhattan_dist(otherRoom):
	#dx+dy
	return abs(otherRoom.get_center()[0]-self.get_center()[0])+abs(otherRoom.get_center()[1]-self.get_center()[1])
func render(tilemap):
	for i in range(x, width+x):
		for j in range(y, height+y):
			var tileSprite = Vector2i(1,0)
			if(i == x or i == x+width-1 or j == y or j == y+height-1):
				tileSprite = Vector2i(0,0)
			tilemap.set_cell(0, Vector2i(i,j), 0, tileSprite)

func check_collide(room):
	if self.x < room.x + room.width and self.x + self.width > room.x and self.y < room.y + room.height and self.height + self.y > room.y:
		return true
	return false
func get_closest_room(rooms):
	var closestDist = 9999999
	var closestRoom = null
	for room in rooms:
		if manhattan_dist(room) < closestDist and manhattan_dist(room) != 0:
			closestRoom = room
			closestDist = manhattan_dist(room)
	return closestRoom
func check_collide_rooms(rooms):
	for room in rooms:
		if check_collide(room):
			return true
	return false
func add_connection(room):
	connections.append(room)
func connect_room(room):
	if room not in connections:
		add_connection(room)
		room.add_connection(self)
		var passage = Passage.new(self,room)
		return passage


