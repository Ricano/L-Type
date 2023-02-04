extends KinematicBody2D

var speed = 400
var enemy
func _ready():
	pass

func _process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed
	if Input.is_action_pressed("ui_left"):
		velocity.x -= speed
	if Input.is_action_pressed("ui_down"):
		velocity.y += speed
	if Input.is_action_pressed("ui_up"):
		velocity.y -= speed
	velocity = velocity.normalized() * speed
	position += velocity * delta
	position.x = clamp(position.x, 0, Globals.screen_size.x)
	position.y = clamp(position.y, 0, Globals.screen_size.y)
	
	if Input.is_action_just_pressed("ui_select"):
		var shot = load("res://Shot.tscn").instance()
		get_parent().add_child(shot)
		shot.global_position = global_position
		
	if Engine.get_physics_frames() % 100 == 0:
		enemy = load("res://Enemy.tscn").instance()
		get_parent().add_child(enemy)

	
