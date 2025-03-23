extends Sprite2D

var o_frustrated_texture = preload('res://sprites/O/O_Frustrated.png')
var o_happy_texture = preload('res://sprites/O/O_Happy.png')
var o_sassy_texture = preload('res://sprites/O/O_Sassy.png')
var o_surprised_texture = preload('res://sprites/O/O_Surprised.png')

func state(eden_state:String):
	match eden_state:
		'frustrated':
			texture = o_frustrated_texture
		'happy':
			texture = o_happy_texture
		'sassy':
			texture = o_sassy_texture
		'surprised':
			texture = o_surprised_texture
		_:
			texture = o_frustrated_texture
