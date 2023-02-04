extends Area2D

var speed = 300


# Called when the node enters the scene tree for the first time.
func _ready():
	var middle = Globals.screen_size.y / 2
	global_position.x = Globals.screen_size.x + 100
	global_position.y = middle + rand_range(-middle * 0.8 , middle * 0.8)


func _process(delta):
	global_position.x -= speed * delta
	if global_position.x<-100:
		queue_free()
		
		
func _on_Shot_body_entered(body):
	if body.is_in_group("Shot"):
		queue_free()


func _on_Enemy_area_entered(area):
	if area.is_in_group("shot"):
		area.queue_free()
		queue_free()
	pass # Replace with function body.
