extends Sprite2D 


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var dir = (Utils.get_player_pos()- position).normalized()
	var motion = dir * 100 * delta
	position += motion	


func _on_enemy_area_area_entered(area):
	queue_free()
