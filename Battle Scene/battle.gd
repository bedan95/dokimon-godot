extends CanvasLayer

var pinkMon = preload("res://Monsters/PinkMon.tscn")

var selected = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = false
	await get_tree().create_timer(1).timeout
	var montemmp = pinkMon.instantiate()
	$Enemy.add_child(montemmp)
	
	$UI/Menu.hide()
	$UI/Fight.hide()
	$UI/Switch.hide()
	$UI/Menu/GridContainer/Fight.grab_focus()
	
	await get_tree().create_timer(2).timeout
	
	for i in Game.SelectedDokimons:
		var monTemp = Game.SelectedDokimons[i]["Scene"].instantiate()
		monTemp.name = Game.SelectedDokimons[i]["Name"]
		monTemp.hide()
		$Player.add_child(monTemp)
		$Player.get_child(0).show()
		$UI/Menu.show()
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func MonsterTurn():
	pass
