extends Node3D

@onready var music_background:=$Player/fondocaverna

# Called when the node enters the scene tree for the first time.
func _ready():
	music_background.play()
	$AnimationPlayer.play("tormenta")
	pass # Replace with function body.


