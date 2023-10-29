extends CharacterBody2D


const SPEED = 300.0

@onready var anim = $AnimationTree

func _physics_process(delta):
	
	move_and_slide()
