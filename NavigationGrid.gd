extends RefCounted
class_name NavigationGrid
var tileGrid
var tilemap
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
