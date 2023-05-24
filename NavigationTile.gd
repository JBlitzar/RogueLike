extends RefCounted
class_name NavigationTile
var contents: String
var x
var y
var atlasSprite: Vector2i
func _init(x,y,tileContents,atlasSprite):
	self.contents = tileContents
	self.x = x
	self.y = y
	self.atlasSprite = atlasSprite
func comparepos(otherTile):
	return otherTile.x == x and otherTile.y == y
func cantor_id():
	return (x+y)*(x+y+1)/2+y
func toVec():
	return Vector2(self.x,self.y)
