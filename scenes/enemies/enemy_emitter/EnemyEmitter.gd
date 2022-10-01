extends Node2D

@onready var timer = $Timer

@export var enemies_to_spawn: Array[PackedScene]= []

func _ready() -> void:
	randomize()

func _on_timer_timeout() -> void:
	var enemy_to_spawn = Utils.choose_random_from_array(enemies_to_spawn)
	# TODO: Change this vector to spawn around the player, outside the viewport
	var enemy = Utils.add_instance_to_scene(enemy_to_spawn, Vector2(randi_range(0, 1152),randi_range(0, 648)), self)
