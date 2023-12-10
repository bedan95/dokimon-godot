extends Control

var maxHealth

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(.5).timeout
	maxHealth = $"../Enemy".get_child(0).Health
	$HPBar.max_value = $"../Enemy".get_child(0).Health
	$HPBar.value = $"../Enemy".get_child(0).Health
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$HPBar.value = $"../Enemy".get_child(0).Health
	$HpTxt.text = str($"../Enemy".get_child(0).Health) + " / " + str(maxHealth)
	$Info.text = "Monster " + str($"../Enemy".get_child(0).name) + " Lvl " + str($"../Enemy".get_child(0).Level)
