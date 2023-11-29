extends StaticBody2D

var Health = 20
var Level = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	Level = randi_range(1,5)
	spawn()
	$Aim/Attack.hide()
	
func hit(anim, damage):
	Health -= damage
	$Aim/Attack.show()
	$Aim/Attack.play(anim)

func spawn():
	$AnimationPlayer.play("Spawn", -1, 2)

func _on_attack_animation_finished():
	$Aim/Attack.hide()

func capture():
	$AnimationPlayer.play("Capture", -1, 3)
	await $AnimationPlayer.animation_finished
	get_parent().get_parent()._one_flee_pressed()
