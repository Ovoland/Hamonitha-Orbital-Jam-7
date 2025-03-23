extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_choice_button_e_1_pressed() -> void:
	get_tree().change_scene_to_file('res://cutscenes/endings/ending_1.tscn')


func _on_choice_button_mo_pressed() -> void:
	get_tree().change_scene_to_file('res://cutscenes/Transitions/chapter_2.tscn')


func _on_choice_button_e_2_pressed() -> void:
	get_tree().change_scene_to_file('res://cutscenes/endings/ending_2.tscn')
