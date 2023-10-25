extends Node3D

class_name Weapon

enum FireMode {SINGLE, BURST, AUTO}

@export var weapon_name : String
@export var damage : int
@export var mag_size : int
@export var fire_mode : FireMode
@export var rpm : int
@export var reload_time : float
@export var weight : int
@export var mesh : MeshInstance3D

func _ready():
	self.hide()

func shoot():
	match fire_mode:
		FireMode.SINGLE:
			print('Shoot once')
		FireMode.BURST:
			print('Burst')
		FireMode.AUTO:
			print('Spray and pray')
