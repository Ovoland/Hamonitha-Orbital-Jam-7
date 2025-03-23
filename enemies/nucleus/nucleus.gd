extends RigidBody2D
signal hit
signal dead

var health = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		health -= 1
		print(health)
		print("hit ! ")
		hit.emit()
		if health <= 0:
			dead.emit()
			hide()
