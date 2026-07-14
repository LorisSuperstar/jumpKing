extends CharacterBody2D

@export var speed = 75
@onready var animated_sprite = $AnimatedSprite2D
@onready var jump_sound = $JumpSound

var can_jump = true
var jump_meter = 0
var loading_up = false
	
func _physics_process(delta):
	
	
	if (is_on_floor()): 
		if velocity.x == 0:
			animated_sprite.play("Idle")
		can_jump = true
		velocity.x = 0
	else: 
		can_jump = false
		animated_sprite.play("Jumping")
		animated_sprite.frame = 2
	
	if Input.is_action_pressed("move_right") and loading_up == false and can_jump == true:
		velocity.x += speed
		animated_sprite.flip_h = false
		animated_sprite.play("Running")
	if Input.is_action_pressed("move_left") and loading_up == false and can_jump == true:
		velocity.x -= speed
		animated_sprite.flip_h = true
		animated_sprite.play("Running")
	if Input.is_action_pressed("jump") and can_jump == true and jump_meter < 100:
		loading_up = true
		jump_meter += 2
		print(jump_meter)
		
		animated_sprite.play("Charging")
		if jump_meter < 50: 
			animated_sprite.frame = 0
		else:
			animated_sprite.frame = 1
		
	elif loading_up == true or jump_meter >= 100:
		if Input.is_action_pressed("move_right"): 
			animated_sprite.flip_h = false
			velocity.x += speed * 3
		if Input.is_action_pressed("move_left"): 
			animated_sprite.flip_h = true
			velocity.x -= speed * 3
		
		if jump_meter < 20:
			jump_sound.play()
			velocity.y -= (20 * 5)
		else:
			jump_sound.play()
			velocity.y -= (jump_meter * 5)
		loading_up = false
		jump_meter = 0;
		can_jump = false
	
	velocity.y += 10
	
	var pre_bounce_velocity_x = velocity.x
	
	move_and_slide()
	
	if is_on_wall() and not is_on_floor():
		velocity.x = -pre_bounce_velocity_x / 3
		velocity.y = velocity.y / 1.5
	if is_on_ceiling():
		velocity.x = velocity.x / 2
