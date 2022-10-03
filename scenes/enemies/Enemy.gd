extends AnimatedSprite2D 

signal enemy_died

@export var health = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
  var player = get_node("/root/Game/Player")
  self.connect("enemy_died", Callable(player, "gain_exp"))


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
  health -= area.damage
  
  if health < 3:
    self.modulate = Color(1.5, 1.0, 1.0, 0.8)
  
  if health < 2:
    self.modulate = Color(1.5, 1.0, 1.0, 0.6)
  
  if health <= 0:
    emit_signal("enemy_died")
    queue_free()
