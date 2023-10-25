extends Node3D

class_name WeaponManager

@onready var selected_weapon
@onready var all_weapons = self.get_children()
@onready var weapon_inventory : Array[Weapon] = []

func _ready():
#	weapon_inventory.append(selected_weapon)
	weapon_inventory.append_array(all_weapons)
	selected_weapon = weapon_inventory[0]
	selected_weapon.show()
	print("Current weapon is: ", selected_weapon.weapon_name)
	
func cycle_weapon(forward : bool = true):
	var index = weapon_inventory.find(selected_weapon)
	selected_weapon.hide()

	if forward:
		if index+1 == weapon_inventory.size():
			selected_weapon = weapon_inventory[0]
		else:
			selected_weapon = weapon_inventory[index+1]
	else:
		if weapon_inventory[index-1]:
			selected_weapon = weapon_inventory[index-1]
		else:
			selected_weapon = weapon_inventory[weapon_inventory.size()-1]
			
	selected_weapon.show()
	print("Switched to: ", selected_weapon.weapon_name)
