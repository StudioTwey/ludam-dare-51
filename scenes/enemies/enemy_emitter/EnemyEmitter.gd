extends Node2D

@onready var timer = $Timer

@export var enemies_to_spawn: Array[PackedScene]= []

func _ready() -> void:
	randomize()
	print(get_viewport().get_visible_rect())

func _on_timer_timeout() -> void:
	var enemy_to_spawn = Utils.choose_random_from_array(enemies_to_spawn)
	spawn_enemy(enemy_to_spawn)

func spawn_enemy(enemy: PackedScene) -> void:
	# Get Player postion + camera view port
	var player_pos = Utils.get_player_pos()
	# Spawn enemy(s) outside of the viewport - 135px radius
	var angle = randf() * PI * 2
	var rand_spawn_pos = Vector2(player_pos.x + cos(angle) * 1500, player_pos.y + sin(angle) * 1500)
	Utils.add_instance_to_scene(enemy, rand_spawn_pos)
