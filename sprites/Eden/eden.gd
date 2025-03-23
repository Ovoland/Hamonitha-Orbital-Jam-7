extends Sprite2D

var eden_default_texture = preload('res://sprites/Eden/E-Den_Default.png')
var eden_happy_texture = preload('res://sprites/Eden/E-Den_Happy.png')
var eden_frustrated_texture = preload('res://sprites/Eden/E-Den_Frustrated.png')
var eden_surprised_texture = preload('res://sprites/Eden/E-Den_Surprised.png')

func state(eden_state:String):
	match eden_state:
		'default':
			texture = eden_default_texture
		'happy':
			texture = eden_happy_texture
		'frustrated':
			texture = eden_frustrated_texture
		'surprised':
			texture = eden_surprised_texture
		_:
			texture = eden_default_texture
