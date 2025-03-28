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
	
func show_ZaWardo_Effect(delay):
	$ZaWarduEffect.text = "ZaWardo effect:" + delay
	$ZaWarduEffect.show()
	
func show_ZaWardo_Cooldown(delay):
	$ZaWarduCooldown.text = "ZaWardo: " + delay
	$ZaWarduCooldown.show()

func _on_message_timer_timeout() -> void:
	$Message.hide()
