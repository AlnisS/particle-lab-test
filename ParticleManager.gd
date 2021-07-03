extends Spatial


func _ready():
	
#	$Particle.freeze(true)
	
	for particle in get_children():
		for particle2 in get_children():
			if particle != particle2:
				particle.register(particle2)


func _physics_process(delta):
	pass
#	$Particle.freeze(Input.is_key_pressed(KEY_SPACE))
	if Input.is_action_just_pressed("ui_down"):
		$Particle.freeze(!$Particle.frozen)
	
	print($Particle.mode)
#	$Particle2.freeze(Input.is_key_pressed(KEY_CONTROL))
