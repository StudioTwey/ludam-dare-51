extends Node2D

@export var sounds: Array[AudioStream] = []

func _ready() -> void:
  print('loading audio...')


func play_sound(sound: int) -> void:
  # This is really bad, but will work for now
  $SoundEffects.play(sounds[sound])
