extends RigidBody2D


@export var direction = Vector2.ZERO
@export var speed = 50
@export var angle = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = direction.normalized() * speed
	position += velocity * delta
	
func wave():
	pass
	
func init(originWave, directionWave, angleWave, speedWave):
	position = originWave
	direction = directionWave
	speed = speedWave	
	rotate(angleWave)
	
