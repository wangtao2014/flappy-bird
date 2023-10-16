extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func play(name: String):
	var sfx = get_node(name)
	if sfx is AudioStreamPlayer:
		sfx.play()
