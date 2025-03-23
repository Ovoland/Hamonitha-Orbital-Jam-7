extends Node

@onready var narrator_scene = preload("res://narrator/narrator.tscn")


var dialog_lines: Array[String] = []
var current_line_index = 0

var narrator
var narrator_position: Vector2

var is_dialog_active = false
var can_advance_line = false

signal dialog_over()

func start_dialog(position: Vector2, lines: Array[String]):
	if is_dialog_active:
		return
	
	dialog_lines = lines
	narrator_position = position
	_show_text_box()
	
	is_dialog_active = true


func _show_text_box():
	narrator = narrator_scene.instantiate()
	narrator.finished_displaying.connect(_on_textbox_finished_displaying)
	get_tree().root.add_child(narrator)
	narrator.global_position = narrator_position
	narrator.display_text(dialog_lines[current_line_index])
	can_advance_line = false


func _on_textbox_finished_displaying():
	can_advance_line = true


func _unhandled_input(event: InputEvent) -> void:
	if (
		event.is_action_pressed('advance_dialog') &&
		is_dialog_active &&
		can_advance_line
	):
		narrator.queue_free()
		
		current_line_index += 1
		if current_line_index >= dialog_lines.size():
			is_dialog_active = false
			current_line_index = 0
			dialog_over.emit()
			return
			
		_show_text_box()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
