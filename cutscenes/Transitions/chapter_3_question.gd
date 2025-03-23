extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_choice_button_fo_pressed() -> void:
	get_tree().change_scene_to_file('res://cutscenes/endings/fight_o.tscn')


func _on_choice_button_e_3_pressed() -> void:
	get_tree().change_scene_to_file('res://cutscenes/Transitions/ending_3.tscn')


func _on_choice_button_e_4_pressed() -> void:
	get_tree().change_scene_to_file('res://cutscenes/endings/ending_4.tscn')
