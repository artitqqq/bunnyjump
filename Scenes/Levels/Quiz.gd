extends Node2D

func _ready():
	pass
	
func _process(delta):
	if $Player.die():
		get_tree().reload_current_scene()