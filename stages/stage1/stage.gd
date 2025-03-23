extends Node2D

@export var electron_scene : PackedScene = preload("res://stages/stage1/enemies/electron/electron.tscn") 
@export var orbital_scene: PackedScene = preload("res://stages/stage1/enemies/orbital/orbital.tscn")

const initRadius = 150

#Determine the number of electrons per layer
var electronsLayerPhase1 = [4,5,6]
var electronsLayerPhase2 = [4,5,5,5]
var electronsLayerPhase3 = [3,4,4,6,7]

var phases = [electronsLayerPhase3,  electronsLayerPhase2, electronsLayerPhase1]
var nbPhase = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_game()
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func game_over() -> void:
	$Music.stop()
	get_tree().change_scene_to_file("res://stages/stage1/UI/death_screen/death_screen.tscn")
	
func new_game():
	$Music.play()
	$player.start($startPosition.position)
	var phase1 = phases.pop_back()
	instanciateBoss(phase1)
	$fightUI.show_message("Phase 1")

func instanciateBoss(electronsLayerPhase):
	var nbLayers = electronsLayerPhase.size()
	for iLayer in range(1,nbLayers + 1):
		#Create the orbit
		var orbit = orbital_scene.instantiate()
		orbit.init($nucleus.position, 0.5*initRadius + initRadius * iLayer)
		add_child(orbit)
		for jElec in range(1, electronsLayerPhase[iLayer -1 ] + 1):
			var angle = 2*PI/electronsLayerPhase[iLayer - 1]
			#Create an electron
			var electron = electron_scene.instantiate()
			electron.init($nucleus.position, 0.5*initRadius + initRadius * iLayer, angle * jElec, (nbLayers - iLayer + 1))	
			add_child(electron)
						
	
	
func _on_nucleus_hit() -> void:
	#Apply a knockback to the player
	cleanOrbitals()
	cleanElectrons()
	var phase = phases.pop_back()
	instanciateBoss(phase)
	var nbLayer = phase.size()
	$fightUI.show_message("Phase " + str(nbPhase - phases.size()))
	print("layer")
	print(nbLayer)
	$player.knockbacking($player.position - $nucleus.position, 0.45 * nbLayer)

	

func cleanOrbitals():
	get_tree().call_group("orbitals", "queue_free")


func cleanElectrons():
	get_tree().call_group("electrons", "queue_free")


func _on_nucleus_dead() -> void:
	cleanOrbitals()
	cleanElectrons()
	$nucleus.queue_free()
	print("You win!")


func _on_player_hit() -> void:
	pass # Replace with function body.
