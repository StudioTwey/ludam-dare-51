extends CharacterBody2D

signal health_depleted


@export var speed = 1000.0
@export var health = 10
var exp = 0

func get_input():
  velocity = Vector2.ZERO
  
  if Input.is_action_pressed("move_right"):
    velocity.x += 1
    $Sprite.play("run")
    $Sprite.flip_h = false
  if Input.is_action_pressed("move_left"):
    velocity.x -= 1
    $Sprite.play("run")
    $Sprite.flip_h = true
  if Input.is_action_pressed("move_down"):
    velocity.y += 1
    $Sprite.play("run")
  if Input.is_action_pressed("move_up"):
    velocity.y -= 1
    $Sprite.play("run")
  
  if velocity.y == 0 and velocity.x == 0:
    $Sprite.play("idle")
  # Stops diagnals from being faster
  velocity = velocity.normalized() * speed

func gain_exp():
  exp += 1
  print(exp)
  
  if exp >= 10:
    print("level up!")
  
func take_damage():
  health -= 1
  
  if health <= 0:
    print("DEAD")
    emit_signal("health_depleted")
  
func _physics_process(_delta):
  get_input()
  move_and_slide()



func _on_area_2d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
  take_damage()
