extends Node

@export var difficulty_modifier := 1.0
@onready var spawn_timer = $SpawnTimer
signal spawn_enemy(number_of_enemies)

func _on_spawn_timer_timeout() -> void:
  emit_signal('spawn_enemy', 100)
  
  difficulty_modifier += .2
