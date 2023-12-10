extends Control

func _ready():
	switchUpdate()

func _on_fight_pressed():
	$Menu.hide()
	$"Fight/GridContainer/Attack 1".grab_focus()
	$Fight.show()

func _on_back_pressed():
	$Menu.show()
	$Menu/GridContainer/Fight.grab_focus()
	$Switch.hide()
	$Fight.hide()

func _process(delta):
	$HPBar.value = Game.SelectedDokimons[get_parent().selected]["Health"]
	$Info.text = str(Game.SelectedDokimons[get_parent().selected]["Name"]) + " LVL" + str(Game.SelectedDokimons[get_parent().selected]["Level"])
	$HpTxt.text = str(Game.SelectedDokimons[get_parent().selected]["Health"])
	#SET ATTACK NAMES
	for i in Game.SelectedDokimons[get_parent().selected]["Attacks"]:
		var path = "Fight/GridContainer/Attack " + str(((i)+1))
		get_node(path).text = Game.SelectedDokimons[get_parent().selected]["Attacks"][i]["Name"]

func _on_switch_pressed():
	$Menu.hide()
	$Switch.show()
	$Fight.hide()
	$"Switch/GridContainer/Dokimon 1".grab_focus()

func _on_flee_pressed():
	$"../../Node2D/UI/AnimationPlayer".play("TransIn")
	await get_tree().create_timer(1.5).timeout
	$"../../Node2D/UI/AnimationPlayer".play("TransOut")
	get_parent().queue_free()
	get_tree().paused = false

func _on_attack_pressed(extra_arg_0):
	if Game.SelectedDokimons[get_parent().selected]["Attacks"][extra_arg_0]["Target"] == "Monster":
		var tempDic = Game.SelectedDokimons[get_parent().selected]["Attacks"]
		$"../Enemy".get_child(0).hit(tempDic[extra_arg_0]["Name"], tempDic[extra_arg_0]["Damage"])
		$"../Action".text = "Your " + str(Game.SelectedDokimons[get_parent().selected]["Name"]) + " Has attacked for " + str(tempDic[0]["Damage"]) + " hp"
		get_parent().MonsterTurn()

func _on_dokimon_pressed(extra_arg_0):
	get_parent().selected = extra_arg_0
	for i in $"../Player".get_child_count():
		$"../Player".get_child(i).get_node("AnimationPlayer").play_backwards("Spawn")
	var path = "../Player/" + str(Game.SelectedDokimons[extra_arg_0]["Name"])
	get_node(path).get_node("AnimationPlayer").play("Spawn")
	get_node(path).show()
	await get_node(path).get_node("AnimationPlayer").animation_finished
	for i in $"../Player".get_child_count():
		$"../Player".get_child(i).hide()
		
	get_node(path).show()
	switchUpdate()
	get_parent().MonsterTurn()
	
func switchUpdate():
	for i in 3:
		var path = "Switch/GridContainer/Dokimon " + str((i+1))
		get_node(path).hide()
	for i in Game.SelectedDokimons:
		if i != get_parent().selected:
			var path = "Switch/GridContainer/Dokimon " + str((i+1))
			get_node(path).text = Game.SelectedDokimons[i]["Name"]
			get_node(path).show()
		
