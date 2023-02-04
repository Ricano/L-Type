extends TileMap

var scroll_speed = 100

func _ready():
	pass

func _process(delta):
	# Scroll the TileMap
	global_position.x -= scroll_speed * delta
	
	# Wrap the TileMap around when it reaches the left edge
	if global_position.x < - Globals.screen_size.x:
		global_position.x = 0
