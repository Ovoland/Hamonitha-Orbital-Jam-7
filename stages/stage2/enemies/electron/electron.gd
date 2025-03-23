extends RigidBody2D


@export var center = Vector2.ZERO
@export var radius = 0 
@export var angle = 0.0
@export var speed = 0

@export var speedfactor = 0.4

var health = 3


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	circular_movement()

func electron():
	pass

func init(orbitCenter, orbitRadius, orbitAngle, orbitSpeed): 
	center = orbitCenter
	radius = orbitRadius
	angle = orbitAngle
	speed = orbitSpeed
	
	
	
func circular_movement():
	angle += speedfactor*speed * get_process_delta_time()
	var x_pos = cos(angle)
	var y_pos = sin(angle) #+ wavingDirection*sin(angle + PI/2) #for even more oscillation
	
	position.x = center.x + radius * x_pos 
	position.y = center.y + radius * y_pos
		
