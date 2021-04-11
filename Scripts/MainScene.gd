extends Node2D

onready var item = preload("res://Scenes/Item.tscn")
var itemList = ["Key", "Key2"]

# Called when the node enters the scene tree for the first time.
func _ready():
	ItemGen()
   
func ItemGen():
	for	_i in range (5):						# создаем 5 обьектов 
		var new_item = item.instance()
		$Items.add_child(new_item)
		new_item.set_item(itemList[rand_range(0,2)])
		randomize()
		new_item.position = Vector2(int(rand_range(0, 1000)), int(rand_range(0, 1000)))
	
func get_player():
	return $Player	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
