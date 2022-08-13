extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 300
var screen_size


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	velocity.y += 1
	velocity = velocity.normalized() * speed
	position += velocity * delta
	
	if position.y > screen_size.y + 20:
		queue_free()
