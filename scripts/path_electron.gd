extends Path2D

const SIZE = 100
const NUM_POINTS = 32

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func createCurve(center: Vector2, radius: float):
	print("CreateCurve")
	print(center)
	curve = Curve2D.new()
	for i in NUM_POINTS:
		var point =  center + Vector2(0, -radius).rotated((i / float(NUM_POINTS)) * TAU)
		curve.add_point(point)

	# End the circle.
	var point = center + Vector2(0, -radius)
	curve.add_point(point)
	
