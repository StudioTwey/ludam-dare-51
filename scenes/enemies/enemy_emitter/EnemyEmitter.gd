extends Node2D

@onready var timer = $Timer

@export var enemies_to_spawn: Array[PackedScene]= []

func _ready() -> void:
  GameManager.spawn_enemy.connect(spawn_enemies)
  randomize()
  print(get_viewport().get_visible_rect())
  
func spawn_enemies(number_of_enemies: int) -> void:
  # Get Player postion + camera view port
  for i in number_of_enemies:
    var player_pos = Utils.get_player_pos()
    var enemy_to_spawn = Utils.choose_random_from_array(enemies_to_spawn)
    # Spawn enemy(s) outside of the viewport - 135px radius
    var angle = randf() * PI * 2
    var rand_spawn_pos = Vector2(player_pos.x + cos(angle) * 1500, player_pos.y + sin(angle) * 1500)
    Utils.add_instance_to_scene(enemy_to_spawn, rand_spawn_pos, self)
