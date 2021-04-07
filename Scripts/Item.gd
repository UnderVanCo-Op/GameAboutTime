extends Node2D

var itemName = ""
var amount = 1

func set_item(it_name):
	itemName = it_name
	$Sprite.texture = load("res://Sprites/Items/" + it_name + ".png")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_item():
	return itemName

func get_amount():
	return amount

func _input(event):
	if event.is_action_pressed("Item_PickUp"):
		var pl = get_parent().get_parent().get_player()
		if abs(pl.position.x - position.x) < 64 && abs(pl.position.y - position.y) < 64: #abs - модуль 
			get_parent().remove_child(self)		# удаляем предмет
			pl.pick(self)		# подбираем предмет
			
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
