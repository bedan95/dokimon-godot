extends Node


func _ready():	
	addDokiMon("PinkMon")
	addDokiMon("PurpleMon")
	
var dataBaseDokiMons = {
	0 : {
		"Name": "PinkMon",
		"Frame": 0,
		"Health": 100,
		"Level": 1,
		"Exp": 0,
		"MaxExp": 10,
		"Strength": 10,
		"Defense": 5,
		"Scene" : preload("res://Monsters/PinkMon.tscn"),
		"Attacks" : {
			0 : {
				"Name" : "Blast",
				"Target": "Monster",
				"Damage": 10,
				"cost": 2
			},
			1 : {
				"Name" : "Clash",
				"Target": "Monster",
				"Damage": 10,
				"cost": 2
			},
			2 : {
				"Name" : "Impact",
				"Target": "Monster",
				"Damage": 10,
				"cost": 2
			}
		}
	},
	1 : {
		"Name": "GreenMon",
		"Frame": 2,
		"Health": 100,
		"Level": 1,
		"Exp": 0,
		"MaxExp": 10,
		"Strength": 10,
		"Defense": 5,
		"Scene" : preload("res://Monsters/GreenMon.tscn"),
		"Attacks" : {
			0 : {
				"Name" : "Blast",
				"Target": "Monster",
				"Damage": 10,
				"cost": 2
			},
			1 : {
				"Name" : "Clash",
				"Target": "Monster",
				"Damage": 10,
				"cost": 2
			},
			2 : {
				"Name" : "Impact",
				"Target": "Monster",
				"Damage": 10,
				"cost": 2
			}
		}
	},
	2 : {
		"Name": "PurpleMon",
		"Frame": 2,
		"Health": 100,
		"Level": 1,
		"Exp": 0,
		"MaxExp": 10,
		"Strength": 10,
		"Defense": 5,
		"Scene" : preload("res://Monsters/PurpleMon.tscn"),
		"Attacks" : {
			0 : {
				"Name" : "Blast",
				"Target": "Monster",
				"Damage": 10,
				"cost": 2
			},
			1 : {
				"Name" : "Clash",
				"Target": "Monster",
				"Damage": 10,
				"cost": 2
			},
			2 : {
				"Name" : "Impact",
				"Target": "Monster",
				"Damage": 10,
				"cost": 2
			}
		}
	}
}

var SelectedDokimons = {
	
}

func addDokiMon(Name):
	for i in dataBaseDokiMons:
		if dataBaseDokiMons[i]["Name"] == Name:
			var tempDic = dataBaseDokiMons[i].duplicate(true)
			SelectedDokimons[SelectedDokimons.size()] = tempDic

func addExp(amount):
	for i in SelectedDokimons:
		SelectedDokimons[i]["Exp"] += amount
		while SelectedDokimons[i]["MaxExp"] <= SelectedDokimons[i]["Exp"]:
			SelectedDokimons[i]["Level"] += 1
			SelectedDokimons[i]["Exp"] -= SelectedDokimons[i]["MaxExp"]
			SelectedDokimons[i]["MaxExp"] *= 1.5
