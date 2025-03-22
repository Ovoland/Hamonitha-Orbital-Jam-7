extends CharacterBody2D


var speed = 300.0
const JUMP_VELOCITY = -400.0
var dashing = false
var last_dir = Vector2.DOWN



func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta

	# Movement handdling
	var direction = Vector2.ZERO # The player's movement vector.
	speed = 300.0
	if Input.is_action_just_pressed("dash"):
		dashing = true
		$DashTimer.start()
		
	if dashing:
		speed = 2000.0
		velocity.x = last_dir.x
		velocity.y = last_dir.y
	else:
		if Input.is_action_pressed("sprint"):
			speed = 600.0
		if Input.is_action_pressed("move_right"):
			direction.x += 1
		if Input.is_action_pressed("move_left"):
			direction.x -= 1
		if Input.is_action_pressed("move_down"):
			direction.y += 1
		if Input.is_action_pressed("move_up"):
			direction.y -= 1
		
		velocity.x = direction.x
		velocity.y = direction.y
			
	if direction != Vector2.ZERO:
		last_dir = direction
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_dash_timer_timeout() -> void:
	dashing = false
