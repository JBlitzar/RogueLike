extends RefCounted
class_name Passage

var r1
var r2
func _init(r1, r2):
	self.r1 = r1
	self.r2 = r2
	assert(not self.r1.check_collide(self.r2) , "ERROR: Collision check failure");
func place_tile(x,y, tilemap):
	tilemap.set_cell(0, Vector2i(x,y), 0, Vector2i(1, 2))
func render_connection(tilemap):
	var start = self.r1.get_center()
	var end = self.r2.get_center()
	for i in range(min(start[0],end[0]),max(start[0],end[0])):
		place_tile(i,start[1],tilemap)
	for i in range(min(start[1],end[1]),max(start[1],end[1])):
		place_tile(max(start[0],end[0]),i,tilemap)
