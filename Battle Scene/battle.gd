extends CanvasLayer

var pinkMon = preload("res://Monsters/PinkMon.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	var montemmp = pinkMon.instantiate()
	$Enemy.add_child(montemmp)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
