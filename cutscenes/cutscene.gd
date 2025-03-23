extends Node2D

@onready var eden_sprite = $Eden
@onready var narrator_screen = $NarratorScreen

var lines: Array[String] = [
	'Kicked out for being late on rent... Again.',
	'My last molecule wasn’t even that bad—carbon backbone, decent bond angles, tight little group. We shared a good orbital. But they finally had enough of me. Said I was unstable. That I brought too much negative energy into the structure.',
	'But then again perhaps I’m not made to be in a big molecule, maybe I’m made for a quiet little place by the shore where I can just be happy... away from the noise, the busyness and the prying eyes. What a dream that would be.'
]

var pos_text_eden = Vector2(40.0,1040.0)
var pos_text_narrator = Vector2(0.0,1080.0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	eden_sprite.state('default')
	lines = [
		'Kicked out for being late on rent... Again.'
	]
	DialogManager.start_dialog(pos_text_eden, lines)
	await DialogManager.dialog_over
	
	eden_sprite.state('happy')
	lines = [
		'My last molecule wasn’t even that bad—carbon backbone, decent bond angles, tight little group. We shared a good orbital. But they finally had enough of me. Said I was unstable. That I brought too much negative energy into the structure.'
	]
	DialogManager.start_dialog(pos_text_eden, lines)
	await DialogManager.dialog_over
	
	eden_sprite.state('default')
	lines = [
	'But then again perhaps I’m not made to be in a big molecule, maybe I’m made for a quiet little place by the shore where I can just be happy... away from the noise, the busyness and the prying eyes. What a dream that would be.'
	]
	DialogManager.start_dialog(pos_text_eden, lines)
	await DialogManager.dialog_over
	lines = [
	'But then again perhaps I’m not made to be in a big molecule, maybe I’m made for a quiet little place by the shore where I can just be happy... away from the noise, the busyness and the prying eyes. What a dream that would be.'
	]
	#NarratorManager.start_dialog(pos_text_eden, lines)
	#await NarratorManager.dialog_over
	narrator_screen.narrator_talk(lines)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
