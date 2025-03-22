extends RigidBody2D

@onready var path: Path2D = $OrbitePath
@onready var path_follow: PathFollow2D = $OrbitePath/OrbitePathFollow2D

var health = 3
var speed = 200

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("default")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if path_follow:
		path_follow.progress += speed*delta
		position = path_follow.position
	
	
func initRotation(center, radius):
	print("before path")
	var path: Path2D = $OrbitePath
	print("after path")
	path.createCurve(center, radius)
	print("after createCurve")
	var path_follow: PathFollow2D = $OrbitePath/OrbitePathFollow2D
	path_follow.progress_ratio = randf()
	
	position = path_follow.position  
