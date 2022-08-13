extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var MIN_PADDING = 20
var screen_size 
var speed = 400


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
	position += velocity * delta
	position.x = clamp(position.x, MIN_PADDING, screen_size.x - MIN_PADDING)


