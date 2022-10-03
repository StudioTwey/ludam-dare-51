extends Node2D

@export var sounds: Array[AudioStream] = []
#@onready var sound_effect_player = $SoundEffects

var sound_effect_player = preload("res://autoloads/SoundEffects.tscn")

func _ready() -> void:
  print('loading audio...')

func play_sound(sound: int) -> void:
  # This is really bad, but will work for now
  var sound_to_play = sounds[sound]
  var player = sound_effect_player.instantiate()
  add_child(player)
  player.stream = sound_to_play
  player.play()


### Audio Dictonary
#0 Sword swoosh
#1 hit sound
