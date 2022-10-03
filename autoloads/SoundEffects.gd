extends AudioStreamPlayer2D

func _ready() -> void:
  self.connect('finished', remove_self)

func remove_self() -> void:
  queue_free()
