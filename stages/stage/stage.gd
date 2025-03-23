extends Node2D

@export var electron_scene : PackedScene = preload("res://enemies/electron/electron.tscn") 
@export var orbital_scene: PackedScene = preload("res://enemies/orbital/orbital.tscn")

var orbitals = []
var electrons = []
#Determine the number of electrons per layer
var electronsPerLayer = [3,3,4]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_game()
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func game_over() -> void:
	get_tree().change_scene_to_file('res://UI/death_screen/death_screen.tscn')
	
func new_game():
	$player.start($startPosition.position)
	instanciateBoss()

func instanciateBoss():
	var nbLayers = electronsPerLayer.size()
	for iLayer in range(1,nbLayers + 1):
		
		#Create the orbit
		var orbit = orbital_scene.instantiate()
		orbit.init($nucleus.position, 100 * iLayer)
		add_child(orbit)
		orbitals.append(orbit)
		var layer_electrons = []
		for jElec in range(1, electronsPerLayer[iLayer -1 ] + 1):
			var angle = 2*PI/electronsPerLayer[iLayer - 1]
			#Create an electron
			var electron = electron_scene.instantiate()
			electron.init($nucleus.position, 100 * iLayer, angle * jElec, (nbLayers - iLayer + 1))	
			add_child(electron)
			
			layer_electrons.append(electron)
			
		electrons.append(layer_electrons)
	
	
func _on_nucleus_hit() -> void:
	#Remove the electrons from the last layer
	var removedElectrons = electrons.pop_back()
	for electron in removedElectrons:
		electron.queue_free()
	var removedOrbital = orbitals.pop_back()
	removedOrbital.queue_free()

func _on_nucleus_dead() -> void:
	print("You win!")
