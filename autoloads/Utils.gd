extends Node

func add_instance_to_scene(scene_to_add: PackedScene, position, container = get_tree().current_scene):
  var instance = scene_to_add.instantiate()

  container.add_child(instance)
  instance.global_position = position

  return instance

func choose_random_from_array(array: Array):
  return array[randi() % array.size()]

func get_player_pos() -> Vector2:
  var player_pos = get_node("/root/Game/Player").position
  return player_pos
