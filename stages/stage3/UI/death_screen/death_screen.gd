extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Music.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed('start_game'):
		$Music.stop()
		get_tree().change_scene_to_file("res://stages/stage3/stage.tscn")

	
