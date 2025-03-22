extends RigidBody2D

@export var electron_scene : PackedScene = preload("res://scenes/electron.tscn")
 
var nulceus = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("before intitation")
	var electron = electron_scene.instantiate()
	print("after instatiation")
	electron.initRotation(position, 20)
	print("after intiRot")
	add_child(electron)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
