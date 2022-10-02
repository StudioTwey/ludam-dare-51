extends AnimatedSprite2D 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
  pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
  var dir = (Utils.get_player_pos()- position).normalized()
  if dir[0] > 0:
    self.flip_h = false
  if dir[0] < 0:
    self.flip_h = true
  var motion = dir * 100 * delta
  position += motion	


func _on_enemy_area_area_entered(area):
  AudioManager.play_sound(1)
  queue_free()
