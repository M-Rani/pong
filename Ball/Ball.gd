extends KinematicBody2D

var speed = 300
var velocity = Vector2.ZERO

func _ready():
	# Set Ball to visible on start
	visible = true
	position = Vector2(OS.get_window_size()/2)
	
	randomize()
	velocity.x = [-1,1][randi() % 2]
	velocity.y = [-0.8,0.8][randi() % 2]

func _physics_process(delta):
	var collision_object = move_and_collide(velocity * speed * delta)
	if collision_object:
		velocity = velocity.bounce(collision_object.normal)			
		if collision_object.collider_velocity == Vector2.ZERO:
			$Collision_Sound.pitch_scale = 0.75
			$Collision_Sound.play()
		else:
			$Collision_Sound.pitch_scale = 0.80
			$Collision_Sound.play()

func stop_ball():
	speed = 0
	position = Vector2(OS.get_window_size()/2)

func restart_ball():
	speed = 295
	velocity.x = [-1,1][randi() % 2]
	velocity.y = [-0.8,0.8][randi() % 2]
