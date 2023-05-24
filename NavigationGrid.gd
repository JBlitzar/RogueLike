extends RefCounted
class_name NavigationGrid
var tileGrid
var tilemap
var astar = AStar2D.new()
func _init(tilemap,tiles):
	self.tileGrid = tiles
	self.tilemap = tilemap
func queryTile(x,y):
	for tile in self.tileGrid:
		if tile.x == x and tile.y == y:
			return tile
	return false
func checkTile(x,y):#true if walkable, false if empty or wall
	var result = queryTile(x,y)
	if not result:
		return false
	else:
		return not result.contents == "wall"
func renderTiles():
	for tile in self.tileGrid:
		self.tilemap.set_cell(0,Vector2(tile.x,tile.y),0,tile.atlasSprite)
func add_astar_points():
	for point in tileGrid:
		astar.add_point(point.cantor_id(),Vector2(point.x,point.y),1)
func connect_astar_points():
	for cell in tileGrid:
		var neighborVecs = [Vector2(0,1),Vector2(0,-1),Vector2(-1,0),Vector2(1,0)]
		for n in neighborVecs:
			var neighbor = n+cell.toVec()
			if checkTile(neighbor.x,neighbor.y):
				astar.connect_points(cell.cantor_id(),queryTile(neighbor.x,neighbor.y).cantor_id(),false)
func init_astar():
	add_astar_points()
	connect_astar_points()
func astar_path(start,end):
	return astar.get_point_path(start.cantor_id(),end.cantor_id())
