extends Control

onready var item = preload("res://Scenes/UI/InventItem.tscn") 	# предзагружаем префаб айтема
onready var hbox = $ScrollC/HBoxC	# Контейнер

func _ready():
	clear()

func clear():		# Очищаем инвентарь
	for i in hbox.get_children():	# Убираем всех детей
		hbox.remove_child(i)
		i.queue_free()

func update_inv(inventory):
	clear()
	for i in inventory.keys():	# Для каждого ключа в 
		var newItem = item.instance()
		hbox.add_child(newItem)
		newItem.set_item(i, inventory[i])
