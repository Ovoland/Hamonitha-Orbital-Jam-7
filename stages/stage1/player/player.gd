extends CharacterBody2D
signal hit

var health = 3
var speed = 300.0
var last_dir = Vector2.DOWN

const KNOCKBACK_VELOCITY = 400
const JUMP_VELOCITY = -400.0

var knockback = Vector2.ZERO
const recoveryTime = 0.3
const knockbackTime = 0.3
var dashing = false

#Abilities
var dashUnlocked = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
	if !dashing:
		speed = 300
	
	#Verify that we aren't in a knocking back animation
	if knockback == Vector2.ZERO:
		# Movement handdling
		var direction = Vector2.ZERO # The player's movement vector.
		if Input.is_action_just_pressed("dash") and dashUnlocked:
			dashing = true
			speed = 2000.0
			velocity = last_dir
			$DashTimer.start()
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
	else:
		velocity = knockback.normalized() * KNOCKBACK_VELOCITY
		move_and_slide()
		

func player():
	pass

func start(pos):
	position = pos
	show()
	$hitbox/CollisionShape2D.disabled = false


func _on_dash_timer_timeout() -> void:
	dashing = false
	speed = 300.0
	

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.has_method("electron"):
		health -= 1
		if true: #health > 0:
			$KnockbackTimer.wait_time = knockbackTime
			knockbacking(position - body.position,$KnockbackTimer.wait_time)
			modulate = Color.RED
			await get_tree().create_timer($KnockbackTimer.wait_time + recoveryTime).timeout
			modulate = Color.WHITE
		else:
			hide()
			hit.emit()
			# Must be deferred as we can't change physics properties on a physics callback.
			$hitbox/CollisionShape2D.set_deferred("disable",true)
			



func knockbacking(directionKnock, delay):
	knockback = directionKnock
	$collisionBox.set_deferred("disabled", true)
	$hitbox/CollisionShape2D.set_deferred("disabled", true)
	$KnockbackTimer.wait_time = delay
	$KnockbackTimer.start()
	
	

func _on_knockback_timer_timeout() -> void:
	knockback = Vector2.ZERO
	await get_tree().create_timer(recoveryTime).timeout
	$collisionBox.set_deferred("disabled", false)
	$hitbox/CollisionShape2D.set_deferred("disabled", false)
