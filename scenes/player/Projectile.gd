extends Area2D

@export var speed = 1500
@export var max_time = 0.5

func start_timer():
	var timer = Timer.new()
	timer.name = "Timer"
	timer.one_shot = true
	timer.wait_time = max_time
	timer.connect("timeout", Callable(self, "_on_timer_timeout"))
	add_child(timer)
	timer.start()
	
func _on_timer_timeout():
	queue_free()

func _ready():
	start_timer()

func _physics_process(delta):
	position += transform.x * speed * delta
