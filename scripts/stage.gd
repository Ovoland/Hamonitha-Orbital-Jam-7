extends Node2D

@export var electron_scene : PackedScene = preload("res://scenes/electron.tscn") 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var electron = electron_scene.instantiate()
	add_child(electron)
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
