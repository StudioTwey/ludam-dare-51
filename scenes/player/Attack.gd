extends Marker2D

const Projectile = preload("res://scenes/player/Attack.tscn")
@export var fire_rate = 5.0

@onready var update_delta = 1 / fire_rate
var current_time = 0

func get_input():
  look_at(get_global_mouse_position())
  if Input.is_action_pressed("ui_accept"):
    current_time = 0
    attack()
    
func attack():
  var projectile = Projectile.instantiate()
  var main = get_tree().current_scene
  main.add_child(projectile)
  projectile.transform = self.global_transform

func _physics_process(delta):
  current_time += delta
  if (current_time < update_delta):
    return
  get_input()
