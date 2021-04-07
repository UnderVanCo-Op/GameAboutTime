extends NinePatchRect

onready var item = preload("res://Scenes/InventItem.tscn")
onready var container = $ScrollC/GridC

func _ready():
	clear()
	visible = false

func clear():		# 
	for i in container.get_children():
		container.remove_child(i)
		i.queue_free()

func show_inventory(inventory):
	clear()		# очищаем предыдущее меню на всякий
	for i in inventory.keys():
		var newItem = item.instance()
		container.add_child(newItem)
		newItem.set_item(i, inventory[i])

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
