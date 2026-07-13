extends CharacterBody2D

@export var speed = 400
var can_jump = true
	
func _physics_process(delta):
	if is_on_floor():
		velocity.y = 0
		can_jump = true
	velocity.x = 0
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
	if Input.is_action_pressed("jump"):
		if can_jump == true:
			can_jump = false
			velocity.y -= 300
	
	velocity.y += 10
	
	move_and_slide()
	
	
