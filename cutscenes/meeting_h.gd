extends Node2D

@onready var eden_sprite = $Eden
@onready var h_sprite = $H
@onready var narrator_screen = $NarratorScreen


var pos_text_eden = Vector2(40.0,1040.0)
var pos_text_h = Vector2(1880.0,1040.0)

var lines: Array[String] = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	eden_sprite.state('frustrated')
	lines = [
		"The rain hasn’t let up. If anything, it’s coming down harder now—like the sky’s trying to scrub the city raw. I keep my head low, hood pulled tight, shoes soaked through hours ago. Every step is a squelch, every breath a cloud."
	]
	DialogManager.start_dialog(pos_text_eden, lines)
	await DialogManager.dialog_over
	
	eden_sprite.state('default')
	lines = [
		"I’m not headed anywhere. I just need to walk for a bit, clear my mind. First part of the plan is to find someone flammable, to really light the fire of my..."
	]
	DialogManager.start_dialog(pos_text_eden, lines)
	await DialogManager.dialog_over
	
	lines = [
		"But just as he lets his gaze wander, Bam!! A bump in the dark."
	]
	narrator_screen.narrator_talk(lines)
	await narrator_screen.narrator_over
	
	eden_sprite.state('surprised')
	lines = [
		"Whoa—sorry!"
	]
	DialogManager.start_dialog(pos_text_eden, lines)
	await DialogManager.dialog_over
	
	lines = [
		"He stumbles back, hands raised."
	]
	narrator_screen.narrator_talk(lines)
	await narrator_screen.narrator_over
	
	h_sprite.visible = true
	
	eden_sprite.state('surprised')
	lines = [
		"I was lost in thought, I didn’t see you and..."
	]
	DialogManager.start_dialog(pos_text_eden, lines)
	await DialogManager.dialog_over
	
	lines = [
		"The passerby flinches, retreating into herself like she was already holding something fragile before he collided into her."
	]
	narrator_screen.narrator_talk(lines)
	await narrator_screen.narrator_over
	
	lines = [
		"Long ponytails fall like curtains over her shoulders. She wears one of those oversized sweaters that swallows you whole—perfect for disappearing into any crowd."
	]
	narrator_screen.narrator_talk(lines)
	await narrator_screen.narrator_over
	
	h_sprite.state('shy')
	lines = [
		"...sorry..."
	]
	DialogManagerH.start_dialog(pos_text_h, lines)
	await DialogManagerH.dialog_over
	
	eden_sprite.state('surprised')
	lines = [
		"I’m sorry, what did you say? I can’t really hear with the rain?"
	]
	DialogManager.start_dialog(pos_text_eden, lines)
	await DialogManager.dialog_over
	
	lines = [
		"...But she doesn’t answer.
		
		Just silence.
		
 		Then suddenly—she turns and runs."
	]
	narrator_screen.narrator_talk(lines)
	await narrator_screen.narrator_over
	
	h_sprite.visible = false
	
	eden_sprite.state('default')
	lines = [
		"And now she’s running. Just great."
	]
	DialogManager.start_dialog(pos_text_eden, lines)
	await DialogManager.dialog_over
	
	eden_sprite.state('surprised')
	lines = [
		"Hey—wait! I just didn’t hear what you said!"
	]
	DialogManager.start_dialog(pos_text_eden, lines)
	await DialogManager.dialog_over
	
	lines = [
		"And so, young  Eli went sprinting after a terrified young lady, at night, in a thunderstorm
 		in hopes of explaining himself—

		…and maybe, just maybe,
 		make a friend on this rain-soaked night."
	]
	narrator_screen.narrator_talk(lines)
	await narrator_screen.narrator_over
	
	
	
	
	get_tree().change_scene_to_file('res://cutscenes/Transitions/chapter_1.tscn')



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
