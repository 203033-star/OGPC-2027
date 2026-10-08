extends CharacterBody2D

const SPEED = 150.0

@onready var player_sprite: AnimatedSprite2D = $Sprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	player_movement()
	player_animation()
	move_and_slide()

func player_movement():
	var input_vector := Input.get_vector("left", "right", "up", "down")
	
	if input_vector:
		velocity = input_vector * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)

func player_animation():
	if velocity == Vector2.ZERO:
		player_sprite.play("idle")
	else:
		player_sprite.play("run")
	
	if velocity.x > 0:
		player_sprite.flip_h = false
	elif velocity.x < 0:
		player_sprite.flip_h = true
