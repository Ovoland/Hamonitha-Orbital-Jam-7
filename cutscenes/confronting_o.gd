extends Node2D

@onready var eden_sprite = $Eden
@onready var h_sprite = $H
@onready var o_sprite = $O
@onready var narrator_screen = $NarratorScreen
@onready var background = $TextureRect

var pos_text_eden = Vector2(40.0,1040.0)
var pos_text_h = Vector2(1880.0,1040.0)
var pos_text_bouncer = Vector2(1880.0,540.0)

var lines: Array[String] = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	h_sprite.flip_h = true
	h_sprite.position.x = 2200.0
	
	lines = [
		"They step out through a side exit, ducking past a flickering emergency light and pushing through the heavy metal door.",
		"It slams shut behind them with a thud—and just like that, the music is gone.",
		"They’re in a back alley now. The night breathes around them again—wet asphalt, dripping pipes, the hum of a broken neon sign overhead.",
		"It’s quiet, but not silent. The kind of quiet that feels like the afterglow of chaos.",
		"H exhales, like she’s been holding her breath since they stepped in."
	]
	narrator_screen.narrator_talk(lines)
	await narrator_screen.narrator_over
	
	eden_sprite.state('default')
	lines = [
		"Well... that was short-lived."
	]
	DialogManager.start_dialog(pos_text_eden, lines)
	await DialogManager.dialog_over

	h_sprite.state('shy')
	lines = [
		"Yeah. But it felt like hours."
	]
	DialogManagerH.start_dialog(pos_text_h, lines)
	await DialogManagerH.dialog_over

	# Narrator: Shared moment
	lines = [
		"They laugh—awkward, real, small.",
		"And for a moment, standing under the dim buzz of a forgotten alley light, they feel more connected than they ever could’ve on that dance floor.",
		"No flashing lights. No distorted bass.",
		"Then the side door creaks open."
	]
	narrator_screen.narrator_talk(lines)
	await narrator_screen.narrator_over
	
	h_sprite.flip_h = false
	h_sprite.position.x = 200
	
	h_sprite.visible = true
	
	o_sprite.state('happy')
	lines = [
		"There you are! I was looking everywhere.",
		"Turns out clubbing alone is a lot less fun when your fake friends vanish."
	]
	DialogManagerH.start_dialog(pos_text_h, lines)
	await DialogManagerH.dialog_over

	eden_sprite.state('frustrated')
	lines = [
		"You ran off."
	]
	DialogManager.start_dialog(pos_text_eden, lines)
	await DialogManager.dialog_over

	o_sprite.state('sassy')
	lines = [
		"I danced off. Huge difference."
	]
	DialogManagerH.start_dialog(pos_text_h, lines)
	await DialogManagerH.dialog_over

	eden_sprite.state('frustrated')
	lines = [
		"Then why bothering coming back to us?"
	]
	DialogManager.start_dialog(pos_text_eden, lines)
	await DialogManager.dialog_over

	o_sprite.state('sassy')
	lines = [
		"Well, you’re the only ones in this part of the circuit that don’t look like they’re about to combust.",
		"Figured I’d stick around. Want to try your luck in the next?",
		"I have a friend that works in the industry."
	]
	DialogManagerH.start_dialog(pos_text_h, lines)
	await DialogManagerH.dialog_over
	
	get_tree().change_scene_to_file('res://cutscenes/Transitions/chapter_3_question.tscn')



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
