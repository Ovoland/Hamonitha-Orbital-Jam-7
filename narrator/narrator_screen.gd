extends ColorRect

signal narrator_over()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func narrator_talk(lines: Array[String]):
	color = Color(0, 0, 0, 0.8)
	var center_screen = Vector2(1920/2,1080/2)
	NarratorManager.start_dialog(center_screen, lines)
	await NarratorManager.dialog_over
	color = Color(0, 0, 0, 0)
	narrator_over.emit()
	
