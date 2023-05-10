extends RefCounted
class_name Passage

var r1
var r2
func _init(r1, r2):
	self.r1 = r1
	self.r2 = r2
	assert(not self.r1.check_collide(self.r2) , "ERROR: Collision check failure");
func place_tile(x,y, tilemap):
	tilemap.set_cell(0, Vector2i(x,y), 0, Vector2i(0, 1))
func render_connection(tilemap):
	var start = self.r1.get_center()
	var end = self.r2.get_center()
	#var line = Line2D.new()
	#line.add_point(Vector2(start[0]*16,start[1]*16))
	#line.add_point(Vector2(end[0]*16,end[1]*16))
	#tilemap.add_child(line)
	var dy = (start[1]-end[1])
	var dx = (start[0]-end[0])
	var slope = dy/dx
	var prevX
	var prevY
	for x in range(start[0],end[0]):
		var gapY=start[1]+dy*(x-start[0])/dx
		place_tile(x,gapY,tilemap)
		if slope > 1:
			if prevX and prevY:
				for y in range(prevY,gapY):
					place_tile(x,y,tilemap)
			#2 points, x,gapY, nextX,nextgapy
		prevX = x
		prevY = gapY
	"""place_tile(start[0],start[1],tilemap)
	var curRise = 0
	var curRun = 1
	var curX = start[0]
	var curY = start[1]
	
	OS.delay_msec(500)
	while true:
		if curRise/curRun < slope:
			curX += 1
			place_tile(curX,curY,tilemap)
		else:
			curY += 1
			place_tile(curX,curY,tilemap)
		curRise = curX-start[0]
		curRun = curY-start[1]
		if curX == end[0] and curY == end[1]:
			break;
	
	
	for i in range(min(start[0],end[0]),max(start[0],end[0])+1):
		place_tile(i,min(start[1],end[1]),tilemap)
	for j in range(min(start[1],end[1]),max(start[1],end[1])):
		place_tile(min(start[0],end[0]),j,tilemap)"""
