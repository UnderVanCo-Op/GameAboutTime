extends Control

func _input(event):
	if event.is_action_pressed("pause"):
		var new_pause_state = not get_tree().paused
		get_tree().paused = new_pause_state		# переключить всю физику дерева сцены
		visible = new_pause_state

func _on_Load_pressed():
	pass # Replace with function body.


func _on_Save_pressed():
	pass # Replace with function body.


func _on_MainMenu_pressed():
	Global.goto_scene("res://Scenes/Title Screen/Title Screen.tscn")
	get_tree().paused = false	# выключаем паузу физики, если она была
	#get_tree().change_scene("res://Scenes/Title Screen/Title Screen.tscn")
