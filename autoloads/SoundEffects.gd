extends AudioStreamPlayer2D

func _ready() -> void:
  connect('finished', Callable(self, 'remove_self'))

func remove_self() -> void:
  queue_free()
