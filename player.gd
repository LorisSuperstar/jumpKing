extends CharacterBody2D

@export var speed = 400
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	
func _physics_process(delta):
	velocity.x = 0
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
	
	move_and_slide()
	
	#if velocity.length() > 0:
		#$AnimatedSprite2D.play()
	#else:
		#$AnimatedSprite2D.stop()
