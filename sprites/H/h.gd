extends Sprite2D

var h_default_texture = preload('res://sprites/H/H_Default.png')
var h_happy_texture = preload('res://sprites/H/H_Happy.png')
var h_shy_texture = preload('res://sprites/H/H_Shy.png')

func state(eden_state:String):
	match eden_state:
		'default':
			texture = h_default_texture
		'happy':
			texture = h_happy_texture
		'shy':
			texture = h_shy_texture
		_:
			texture = h_default_texture
