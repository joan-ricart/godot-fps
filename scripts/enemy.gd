extends CharacterBody3D


const SPEED = 5.0
@onready var NavigationAgent = $NavigationAgent3D

func _physics_process(delta):
	NavigationAgent.target_position = Vector3(10,1,10)

	move_and_slide()
