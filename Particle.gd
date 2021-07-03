extends RigidBody


var other_particles: Array = []


var frozen = false


func _ready():
	$AnimatedSprite3D.frame = randi() % 27


func _integrate_forces(state):
	if frozen:
		$AnimatedSprite3D.offset = Vector2(rand_range(-1, 1), 5.0 + rand_range(-1, 1))
		$AnimatedSprite3D.playing = false
		
		state.linear_velocity = Vector3.ZERO
	else:
		$AnimatedSprite3D.offset = Vector2(0.0, 5.0)
		$AnimatedSprite3D.playing = true
		
		for other in other_particles:
			var displacement: Vector3 = other.get_global_transform().origin - get_global_transform().origin
			var distance = displacement.length()
			var normalized = displacement.normalized()
			var force = normalized * (1.66 - 1.00 / distance)
			state.add_central_force(force)


func register(other):
	other_particles.append(other)


func freeze(value: bool):
	frozen = value
	if value:
		set_mode(MODE_KINEMATIC)
	else:
		set_mode(MODE_RIGID)

