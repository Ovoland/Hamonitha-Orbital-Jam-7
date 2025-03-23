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
	h_sprite.state('default')
	lines = [
		"You. We’re running from you."
	]
	DialogManagerH.start_dialog(pos_text_h, lines)
	await DialogManagerH.dialog_over

	eden_sprite.state('surprised')
	lines = [
		"Then there must be a mistake, I only started running after you did."
	]
	DialogManager.start_dialog(pos_text_eden, lines)
	await DialogManager.dialog_over

	eden_sprite.state('happy')
	lines = [
		"But anyways, I’m Eli, do you wanna grab a bite?"
	]
	DialogManager.start_dialog(pos_text_eden, lines)
	await DialogManager.dialog_over

	lines = [
		"And so they went into the city looking for a place to eat, making small talk along the way, and eventually arriving towards the nightclub district."
	]
	narrator_screen.narrator_talk(lines)
	await narrator_screen.narrator_over

	eden_sprite.state('normal')
	lines = [
		"...so correct me if I’m wrong..."
	]
	DialogManager.start_dialog(pos_text_eden, lines)
	await DialogManager.dialog_over

	eden_sprite.state('surprised')
	lines = [
		"You’re saying—you wrote a book?!"
	]
	DialogManager.start_dialog(pos_text_eden, lines)
	await DialogManager.dialog_over

	h_sprite.state('shy')
	lines = [
		"Yeah. I mean... it’s not really well known or anything."
	]
	DialogManagerH.start_dialog(pos_text_h, lines)
	await DialogManagerH.dialog_over

	eden_sprite.state('surprised')
	lines = [
		"Still, that’s kind of amazing. I’ve never met someone who’s written an entire book before. What’s it about?"
	]
	DialogManager.start_dialog(pos_text_eden, lines)
	await DialogManager.dialog_over

	h_sprite.state('shy')
	lines = [
		"It’s hard to explain...",
		"It’s sort of a story about people of everyday life that are everywhere but don't get credit. Kind of sad. Definitely weird."
	]
	DialogManagerH.start_dialog(pos_text_h, lines)
	await DialogManagerH.dialog_over

	eden_sprite.state('happy')
	lines = [
		"Sounds like something I’d like. Or something that would confuse me in the best way possible."
	]
	DialogManager.start_dialog(pos_text_eden, lines)
	await DialogManager.dialog_over

	h_sprite.state('happy')
	lines = [
		"You’d probably make fun of the metaphors."
	]
	DialogManagerH.start_dialog(pos_text_h, lines)
	await DialogManagerH.dialog_over

	eden_sprite.state('happy')
	lines = [
		"I would never! I’d be the metaphor's number one fan. I’d get a poster that says 'Support Your Local Sad Hydrogen.'"
	]
	DialogManager.start_dialog(pos_text_eden, lines)
	await DialogManager.dialog_over

	h_sprite.state('happy')
	lines = [
		"Well… that might actually be better marketing than what I had."
	]
	DialogManagerH.start_dialog(pos_text_h, lines)
	await DialogManagerH.dialog_over

	eden_sprite.state('normal')
	lines = [
		"Seriously though—why don’t more people know about it?"
	]
	DialogManager.start_dialog(pos_text_eden, lines)
	await DialogManager.dialog_over

	h_sprite.state('shy')
	lines = [
		"I didn’t really tell anyone. I just… uploaded it to a data cloud once and walked away.",
		"That was the end of that, and I haven't brought it up since. Until now, that is."
	]
	DialogManagerH.start_dialog(pos_text_h, lines)
	await DialogManagerH.dialog_over

	lines = [
		"As a comfortable silence settled between them, the calm was shattered by the unmistakable loudening of arguments escalating just across the street—sharp words flaring louder than the beat pulsing behind the club doors.",
		"A figure stood toe-to-toe with the bouncer, arms flailing dramatically beneath the haze of streetlight and neon."
	]
	narrator_screen.narrator_talk(lines)
	await narrator_screen.narrator_over

	eden_sprite.visible = false
	h_sprite.visible = false
	o_sprite.visible = true
	
	o_sprite.flip_h = true
	
	o_sprite.state('frustrated')
	lines = [
		"I told you already, the two friends I came with are inside. Just let me back in so I can rejoin them!",
		"And for the last time—I didn’t steal the ticket, it was gifted in a very non-consensual way!"
	]
	DialogManager.start_dialog(pos_text_eden, lines)
	await DialogManager.dialog_over

	eden_sprite.visible = true
	h_sprite.visible = true
	o_sprite.visible = false
	
	h_sprite.flip_h = false
	h_sprite.position.x = 1000

	eden_sprite.state('default')
	lines = [
		"And some people should really not be allowed to shout..."
	]
	DialogManager.start_dialog(pos_text_eden, lines)
	await DialogManager.dialog_over

	eden_sprite.visible = false
	h_sprite.visible = false
	o_sprite.visible = true
	
	o_sprite.state('surprised')
	lines = [
		"Ohhh, so you’re saying if I just bring two people, I can get in?"
	]
	DialogManager.start_dialog(pos_text_eden, lines)
	await DialogManager.dialog_over
	
	
	o_sprite.flip_h = false
	
	eden_sprite.visible = true
	h_sprite.visible = true
	
	h_sprite.position.x = 200
	
	
	o_sprite.state('happy')
	lines = [
		"Perfect! You two! Yes, you—the brooding poet and the walking dopamine spiral. You look like fun."
	]
	DialogManagerH.start_dialog(pos_text_h, lines)
	await DialogManagerH.dialog_over

	eden_sprite.state('surprised')
	lines = [
		"Wait, what?"
	]
	DialogManager.start_dialog(pos_text_eden, lines)
	await DialogManager.dialog_over

	o_sprite.state('sassy')
	lines = [
		"Twenty minutes. Tops. I won’t even make eye contact unless you offer me a drink.",
		"Look, I can see it in your eyes—you’re intrigued, bored, or trapped in a side quest. Whatever the reason, you’re already halfway to agreeing."
	]
	DialogManagerH.start_dialog(pos_text_h, lines)
	await DialogManagerH.dialog_over
	
	
	o_sprite.flip_h = true
	o_sprite.position.x = 2000
	
	o_sprite.state('sassy')
	lines = [
		"See? Here they are! My dear friends who definitely came outside just to meet me. We’re ready to re-enter this glittering temple of bass and bad decisions!"
	]
	DialogManagerH.start_dialog(pos_text_h, lines)
	await DialogManagerH.dialog_over

	# Assuming bouncer is a side character with its own manager:
	#bouncer_sprite.state('neutral')  # Use default or remove if not needed
	lines = [
		"You vouch for her?"
	]
	DialogManagerH.start_dialog(pos_text_bouncer, lines)
	await DialogManagerH.dialog_over

	eden_sprite.state('frustrated')
	lines = [
		"I… guess we do now?"
	]
	DialogManager.start_dialog(pos_text_eden, lines)
	await DialogManager.dialog_over
	
	
	o_sprite.flip_h = false
	o_sprite.position.x = 1000
	
	
	o_sprite.state('happy')
	lines = [
		"Brilliant. You two are stars. I owe you a soda. Or a story. Your pick."
	]
	DialogManagerH.start_dialog(pos_text_h, lines)
	await DialogManagerH.dialog_over

	lines = [
		"And just like that, the three of them disappear into the mouth of the nightclub, swallowed by flashing lights, heavy beats, and the thrum of strangers orbiting too close.",
		"Whatever this was, it wasn’t going to be boring."
	]
	narrator_screen.narrator_talk(lines)
	await narrator_screen.narrator_over
	
	background.texture = preload("res://cutscenes/backgrounds/club.png")
	
	o_sprite.visible = false
	
	h_sprite.position.x = 1000

	lines = [
		"Inside the club, everything pulses—walls, lights, even the floor to the rhythm of the speaker’s lining. The air is thick with smoke reflecting the ultraviolet hues of neons, lasers and glowsticks. The bass floods your lungs before you hear it, the drums are a second heartbeat and the synth replaces your thought. Clusters of dancers move like atoms in a heated reaction—flashing, spinning, colliding. The bar serves glasses of dizzying colours. Everything blends into a sensory soup designed to keep you moving."
	]
	narrator_screen.narrator_talk(lines)
	await narrator_screen.narrator_over
	
	h_sprite.state('shy')
	lines = [
		"We just entered purgatory, I think..."
	]
	DialogManagerH.start_dialog(pos_text_h, lines)
	await DialogManagerH.dialog_over

	eden_sprite.state('surprised')
	lines = [
		"Hey—wait for us!"
	]
	DialogManager.start_dialog(pos_text_eden, lines)
	await DialogManager.dialog_over
	
	lines = [
		"But O is already gone, swallowed whole by the dance floor. A flash of color, a laugh in the strobe light, then nothing.  Eli and H stand at the edge, blinking against the sensory onslaught."
	]
	narrator_screen.narrator_talk(lines)
	await narrator_screen.narrator_over
	
	h_sprite.flip_h = true
	h_sprite.position.x = 2200
	
	eden_sprite.state('default')
	lines = [
		"Okay… so we lost her."
	]
	DialogManager.start_dialog(pos_text_eden, lines)
	await DialogManager.dialog_over
	
	h_sprite.state('default')
	lines = [
		"I'm not even sure we ever had her..."
	]
	DialogManagerH.start_dialog(pos_text_h, lines)
	await DialogManagerH.dialog_over
	
	lines = [
		"They linger for a minute longer.  Eli tries to bob to the beat. H shifts her weight awkwardly. The music is relentless. Every second stretches like a rubber band pulled too thin."
	]
	narrator_screen.narrator_talk(lines)
	await narrator_screen.narrator_over
	
	h_sprite.state('shy')
	lines = [
		"I can’t do this,  she murmurs, barely audible even to herself."
	]
	DialogManagerH.start_dialog(pos_text_h, lines)
	await DialogManagerH.dialog_over
	
	get_tree().change_scene_to_file('res://cutscenes/Transitions/chapter_3.tscn')



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
