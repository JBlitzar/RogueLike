extends CharacterBody2D
var health = 1
@export var damageAmount = 0.1
var playerPos = Vector2(0,0)
var vel = Vector2(0,0)
var target = position
var speed = 16
signal input_recieved
func _input(event):
	if event.is_action_pressed("up"):
		vel= Vector2(0,-1)
	if event.is_action_pressed("down"):
		vel= Vector2(0,1)
	if event.is_action_pressed("left"):
		vel= Vector2(-1,0)
	if event.is_action_pressed("right"):
		vel= Vector2(1,0)
func _physics_process(delta):
	if vel != Vector2(0,0):
		#print("move")
		var newPos = (playerPos+vel)
		if get_parent().gridObject.checkTile(newPos.x,newPos.y):
			#print("tile check passed")
			playerPos = newPos
			vel = Vector2(0,0)
			get_parent().advanceEnemies()
			position = get_parent().map_to_local(playerPos)
	#target = get_parent().map_to_local(playerPos)
	#velocity = position.direction_to(target) * speed
	#move_and_slide()
func damage():
	health -= damageAmount
	$Control/HealthBar.value = health

