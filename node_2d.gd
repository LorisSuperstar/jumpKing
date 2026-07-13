extends Node2D

@onready var camera = $Camera2D
@onready var player = $Player 

func _physics_process(delta):
	var screen_size = get_viewport().get_visible_rect().size
	var screen_width = screen_size.x
	var screen_height = screen_size.y
	
	var current_screen_y = floor(player.global_position.y / screen_height)
	var current_screen_x = floor(player.global_position.x / screen_width)
	
	var target_camera_y = (current_screen_y * screen_height) + (screen_height / 2.0)
	var target_camera_x = (current_screen_x * screen_width) + (screen_width / 2.0)
	
	camera.global_position = Vector2(target_camera_x, target_camera_y)
