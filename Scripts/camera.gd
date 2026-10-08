extends Camera2D

@onready var human: CharacterBody2D = %Human

const smooth_rate := 10.0
const look_ahead_distance := 48.0

var subject_position: Vector2

func _physics_process(delta: float) -> void:
	subject_position = human.global_position
	
	global_position = subject_position
