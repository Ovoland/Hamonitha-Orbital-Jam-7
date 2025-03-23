extends CharacterBody2D
signal hit
signal zaWarudo

var health = 3
var speed = 300.0
var last_dir = Vector2.DOWN

const DEFAULT_SPEED = 300
const KNOCKBACK_VELOCITY = 400
const DASH_VELOCITY = 1500
const SRINT_VELOCITY = 600
const JUMP_VELOCITY = -400.0

var knockback = Vector2.ZERO
const recoveryTime = 0.5
const knockbackTime = 0.3
var dashing = false

#Abilities
var dashUnlocked = true
var dashCoolDowned = false
var timeStopCoolDowned = false
var ZAWARDO_FACTOR = 1.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
	if !dashing:
		speed = DEFAULT_SPEED
	
	#Verify that we aren't in a knocking back animation
	if knockback == Vector2.ZERO:
		if Input.is_action_just_pressed("timeStop") and !timeStopCoolDowned:
			zaWarudo.emit()
			timeStopCoolDowned = true
			$TimeStopCoolDown.start()

		# Movement handdling
		var direction = Vector2.ZERO # The player's movement vector.
		if Input.is_action_just_pressed("dash") and !dashCoolDowned and  dashUnlocked:
			dashing = true
			dashCoolDowned = true
			speed = DASH_VELOCITY
			velocity = last_dir
			$collisionBox.set_deferred("disabled", true)
			$hitbox/CollisionShape2D.set_deferred("disabled", true)
			$DashTimer.start()
			$DashCooldown.start()
		else:
			if Input.is_action_pressed("sprint"):
				speed = SRINT_VELOCITY
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
			velocity = velocity.normalized() * speed * ZAWARDO_FACTOR
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
	$collisionBox.set_deferred("disabled", false)
	$hitbox/CollisionShape2D.set_deferred("disabled", false)
	speed = DEFAULT_SPEED
	

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.has_method("electron") or body.has_method("wave"):
		health -= 1
		if health > 0:
			$MusicHit.play()
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


func _on_time_stop_cool_down_timeout() -> void:
	timeStopCoolDowned = false


func _on_dash_cooldown_timeout() -> void:
	dashCoolDowned = false
	
func setOnZawardo():
	ZAWARDO_FACTOR = 0.2
	
func setOffZawardo():
	ZAWARDO_FACTOR = 1
