extends Control

var ContGame : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _on_StartNewGameB_pressed():
	$Fade/AnimationPlayer.play("fade")
	#print("but worked")


func _on_AnimationPlayer_animation_finished(anim_name):
	#print("change scene worked")
	#get_tree().change_scene("res://Scenes/Levels/Level1/Root.tscn")
	if(ContGame):
		Global.load_game()
		ContGame = false
	Global.goto_scene("res://Scenes/Levels/Level1/Root.tscn")


func _on_ContinueB_pressed():
	$Fade/AnimationPlayer.play("fade")
	ContGame = true
