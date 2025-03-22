extends RigidBody2D


@export var center = Vector2.ZERO
@export var radius = 0 
@export var angle = 0.0
@export var speed = 0


var health = 3


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("ready")
	$AnimatedSprite2D.play("default")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	circular_movement()

func init(orbitCenter, orbitRadius, orbitAngle, orbitSpeed): 
	center = orbitCenter
	radius = orbitRadius
	angle = orbitAngle
	speed = orbitSpeed
	
	
func circular_movement():
	angle += speed * get_process_delta_time()
	var x_pos = cos(angle)
	var y_pos = sin(angle) #+ 0.2*sin(5*angle + PI/2) for even more oscillation
	
	position.x = center.x + radius * x_pos
	position.y = center.y + radius * y_pos
		
