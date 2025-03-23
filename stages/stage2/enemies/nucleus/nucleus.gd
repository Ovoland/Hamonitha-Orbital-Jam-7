extends RigidBody2D
signal hit
signal dead
signal wave

var health = 3
const recoveryTime = 0.2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		health -= 1
		if health <= 0:
			await get_tree().create_timer(0.2).timeout
			$DeathMusic.play()			
			modulate = Color.RED
			await get_tree().create_timer(0.5).timeout
			dead.emit()
			queue_free()
		else:
			$HitMusic.play()
			hit.emit()
			modulate = Color.RED
			await get_tree().create_timer(recoveryTime).timeout
			modulate = Color.WHITE

			
func chargeAttack():
	$WaveMusic.play()
	modulate = Color.BLUE
	await get_tree().create_timer(3*recoveryTime).timeout
	modulate = Color.WHITE
