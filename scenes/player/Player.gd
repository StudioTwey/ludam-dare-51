extends Sprite2D

@export var BASE_SPEED := 250

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += BASE_SPEED
	if Input.is_action_pressed("move_left"):
		velocity.x -= BASE_SPEED
	if Input.is_action_pressed("move_down"):
		velocity.y += BASE_SPEED
	if Input.is_action_pressed("move_up"):
		velocity.y -= BASE_SPEED
	position += velocity * delta
