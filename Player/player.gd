extends CharacterBody2D

@export var speed = 100
var can_jump = true
var jump_meter = 0
var loading_up = false
	
func _physics_process(delta):
	
	if (is_on_floor()): 
		can_jump = true
		velocity.x = 0
	else: 
		can_jump = false
		
	
	if Input.is_action_pressed("move_right") and loading_up == false and can_jump == true:
		velocity.x += speed
	if Input.is_action_pressed("move_left") and loading_up == false and can_jump == true:
		velocity.x -= speed
	if Input.is_action_pressed("jump") and can_jump == true and jump_meter < 100:
		loading_up = true
		jump_meter += 2
		print(jump_meter)
		
	elif loading_up == true or jump_meter >= 100:
		if Input.is_action_pressed("move_right"): 
			velocity.x += speed * 2
		if Input.is_action_pressed("move_left"): 
			velocity.x -= speed * 2
		
		if jump_meter < 20:
			velocity.y -= (20 * 5)
		else:
			velocity.y -= (jump_meter * 5)
		loading_up = false
		jump_meter = 0;
		can_jump = false
	
	velocity.y += 10
	
	var pre_bounce_velocity_x = velocity.x
	
	move_and_slide()
	
	if is_on_wall() and not is_on_floor():
		velocity.x = -pre_bounce_velocity_x * 0.5
		velocity.y = velocity.y / 2
