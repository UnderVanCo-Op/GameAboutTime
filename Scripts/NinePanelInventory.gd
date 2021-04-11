extends NinePatchRect

onready var item = preload("res://Scenes/InventItem.tscn") 	# предзагружаем префаб айтема
onready var container = $ScrollC/GridC	# Контейнер

func _ready():
	clear()		# Очищаем инвентарь по старту
	visible = false		# Скрываем по старту

func clear():		# Очищаем инвентарь
	for i in container.get_children():	# Убираем всех детей
		container.remove_child(i)
		i.queue_free()

func show_inventory(inventory):		# Показать инвентарь
	clear()		# очищаем предыдущий инвентарь на всякий
	for i in inventory.keys():	# Для каждого ключа в 
		var newItem = item.instance()
		container.add_child(newItem)
		newItem.set_item(i, inventory[i])

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
