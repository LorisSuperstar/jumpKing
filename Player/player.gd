extends CharacterBody2D

@export var speed = 400

	
func _physics_process(delta):
	velocity.x = 0
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
	
	velocity.y += 10
	
	move_and_slide()
	
	if is_on_floor():
		velocity.y = 0
