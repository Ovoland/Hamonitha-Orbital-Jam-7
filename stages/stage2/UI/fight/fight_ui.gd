extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	
	

func _on_message_timer_timeout() -> void:
	$Message.hide()
	
func show_tuto():
	$Tuto.show()
	$TutoTimer.start()
	


func _on_tuto_timer_timeout() -> void:
	$Tuto.hide()
