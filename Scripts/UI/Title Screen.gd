extends Control



# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = false


func _on_StartNewGameB_pressed():
	$Fade/AnimationPlayer.play("fade")
	#print("but worked")


func _on_AnimationPlayer_animation_finished(anim_name):
	#print("change scene worked")
	#get_tree().change_scene("res://Scenes/Levels/Level1/Root.tscn")
	Global.goto_scene("res://Scenes/Levels/Level1/Root.tscn")
