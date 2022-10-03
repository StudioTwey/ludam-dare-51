extends Node2D

@export var sounds: Array[AudioStream] = []
@onready var sound_effect_player = $SoundEffects 

func _ready() -> void:
  print('loading audio...')

func play_sound(sound: int) -> void:
  # This is really bad, but will work for now
  var sound_to_play = sounds[sound]
  sound_effect_player.stream = sound_to_play
  sound_effect_player.play()


### Audio Dictonary
#0 Sword swoosh
#1 hit sound
