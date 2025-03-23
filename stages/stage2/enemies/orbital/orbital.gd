extends RigidBody2D

@export var center = Vector2.ZERO
@export var radius = 0 
@export_range(1, 1000) var segments : int = 100
@export var color = Color(1,1,1,0.2)
@export var width = 1
@export var antialiasing : bool = true


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func init(orbitalCenter, orbitalRadius):
	center = orbitalCenter
	radius = orbitalRadius	
	queue_redraw()
	
func _draw() -> void:
	draw_arc(center, radius,0, 2*PI,segments, color,width,antialiasing)
	
