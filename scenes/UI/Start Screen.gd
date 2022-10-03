extends Control





func _on_startbutton_pressed():
  get_tree().change_scene_to_file("res://game/Game.tscn")


func _on_endbutton_pressed():
  get_tree().quit()
