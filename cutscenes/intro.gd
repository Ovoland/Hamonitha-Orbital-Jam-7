extends Node2D

@onready var eden_sprite = $Eden
@onready var narrator_screen = $NarratorScreen


var pos_text_eden = Vector2(40.0,1040.0)

var lines: Array[String] = [
	"The rain was pouring on the streets, a few lit up showcases lighting up the pavement. The last of particles hurrying to their respective molecules before the storm fully hits.

The rain poured relentlessly on the city streets, each droplet drumming a quiet rhythm against the pavement. Dimly lit shopfronts casting golden reflections on the smooth cobblestone, flickering with the rising wind. In the shimmering haze, the last of the particles hurried along the gutters. 

They darted through the air in search of shelter, their footsteps light and quick, cloaks trailing behind them like smoke. Each one knew the storm was close now. They could feel it in their bones, in the charged air, and in the static that pulled at their skin. Around them, the great Molecules loomed—towering structures of proton bricks and electromagnetic cement and standing like silent titans with outstretched arms.

And somewhere in that city, beneath the hum of street posts and the whisper of the wind, a story was about to begin—of connection, of unraveling, and of the delicate choreography between chance and choice."

]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	narrator_screen.narrator_talk(lines)
	await narrator_screen.narrator_over
	
	lines = [
		"In a back alley under a makeshift shelter—no more than a flattened soup can and a scrap of discarded insulation—sat a young electron named  Eli. His socks, if you could call them that, were soaked through with runoff from the cracked concrete above. Raindrops slipped down rusted drain pipes in crooked rhythms, like a heartbeat with a limp.
		
		Eli shivered, not from the cold, but from shame."
	]
	narrator_screen.narrator_talk(lines)
	await narrator_screen.narrator_over
	
	lines = [
		'Kicked out for being late on rent... Again.'
	]
	DialogManager.start_dialog(pos_text_eden, lines)
	await DialogManager.dialog_over
	
	eden_sprite.state('default')
	lines = [
		'My last molecule wasn’t even that bad—carbon backbone, decent bond angles, tight little group. We shared a good orbital. But they finally had enough of me. Said I was unstable. That I brought too much negative energy into the structure.'
	]
	DialogManager.start_dialog(pos_text_eden, lines)
	await DialogManager.dialog_over
	
	eden_sprite.state('happy')
	lines = [
		'But then again perhaps I’m not made to be in a big molecule, maybe I’m made for a quiet little place by the shore where I can just be happy... away from the noise, the busyness and the prying eyes. What a dream that would be.'
	]
	DialogManager.start_dialog(pos_text_eden, lines)
	await DialogManager.dialog_over
	
	lines = [
		"And as if heard by the heavens the sprout of an idea started to form in the back of his head. And before long he began to start putting his plan in action."
	]
	narrator_screen.narrator_talk(lines)
	await narrator_screen.narrator_over
	
	eden_sprite.state('happy')
	lines = [
		"And... it’s finished... Normally this molecule should hold, I just need the people to fill it. So now I just need friends basically..."
	]
	DialogManager.start_dialog(pos_text_eden, lines)
	await DialogManager.dialog_over
	
	eden_sprite.state('default')
	lines = [
		"..."
	]
	DialogManager.start_dialog(pos_text_eden, lines)
	await DialogManager.dialog_over
	
	eden_sprite.state('default')
	lines = [
		"God, my life is pathetic..."
	]
	DialogManager.start_dialog(pos_text_eden, lines)
	await DialogManager.dialog_over
	
	lines = [
		"And so our brave hero went on the noble quest to find friendship."
	]
	narrator_screen.narrator_talk(lines)
	await narrator_screen.narrator_over
	
	
	get_tree().change_scene_to_file('res://cutscenes/Transitions/chapter_1.tscn')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

	
