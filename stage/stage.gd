extends Node2D

@export var electron_scene : PackedScene = preload("res://electron/electron.tscn") 

var electrons = []
var electronsPerLayer = [3,3,4]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var nbLayers = electronsPerLayer.size()
	for iLayer in range(1,nbLayers + 1):
		for jElec in range(1, electronsPerLayer[iLayer -1 ] + 1):
			var angle = 2*PI/electronsPerLayer[iLayer - 1]
			var electron = electron_scene.instantiate()
			electron.init($nucleus.position, 100 * iLayer, angle * jElec, (nbLayers - iLayer + 1))
			print("elec init")
	
			add_child(electron)

	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
