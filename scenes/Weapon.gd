extends Node3D

class_name Weapon

enum FireMode {SINGLE, AUTO}

@export var weapon_name : String
@export var damage : int
@export var mag_size : int
@export var fire_mode : FireMode
@export var rpm : int
@export var reload_time : float
@export var weight : int
@export var mesh : MeshInstance3D

@onready var ammo := mag_size
var fire_rate : float
var time := 0.0

func _ready():
	self.hide()
	if fire_mode == FireMode.AUTO:
		fire_rate = (1000/(rpm/60.0))*0.001

func shoot(delta):
	match fire_mode:
		FireMode.SINGLE:
			if (ammo == 0):
				print('Out of ammo')
				return

			if (ammo > 0):
				ammo -= 1
				print('shoot - ammo left: ', ammo)

		FireMode.AUTO:
			if (ammo == 0):
				print('Out of ammo')
				return

			if (ammo > 0):
				if time == 0 or time >= fire_rate:
					if time != 0:
						time -= fire_rate
					ammo -= 1
					print('shoot - ammo left: ', ammo)
					
				time += delta

func reload():
	if ammo < mag_size:
		ammo = mag_size
		print("Reloaded. Current ammo: ", ammo)
	else:
		print("Full ammo")

func reset_time():
	time = 0.0
	print("Timer reset")
