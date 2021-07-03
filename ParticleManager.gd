extends Spatial

var elapsed_time = 0.0

func _ready():
	
	$Particle.freeze(true)
	
	for particle in get_children():
		for particle2 in get_children():
			if particle != particle2:
				particle.register(particle2)

func _physics_process(delta):
	pass
	
	elapsed_time += delta
	
	
	if Input.is_action_pressed("rmb"):
		$Particle.transform.origin.z = -3 + 6 * get_viewport().get_mouse_position().x / get_viewport().size.x
		$Particle.transform.origin.y = 1.5
	else:
		$Particle.transform.origin.z = sin(elapsed_time * 0.5) * 5
		$Particle.transform.origin.y = cos(elapsed_time * 0.5) * 3
#	$Particle.freeze(Input.is_key_pressed(KEY_SPACE))
#	if Input.is_action_just_pressed("ui_down"):
#		$Particle.freeze(!$Particle.frozen)
	
#	print($Particle.mode)
#	$Particle2.freeze(Input.is_key_pressed(KEY_CONTROL))
