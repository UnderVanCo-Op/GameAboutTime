extends Control

onready var pack = $NinePanel	# Хранит ссыль на ninePanel
onready var item = preload("res://Scenes/InventItem.tscn") 	# предзагружаем префаб айтема
onready var hbox = $ScrollC/HBoxC	# Контейнер

func toggle_inventory(inventory):	# Метод переключения видимости инвентаря
	if pack.visible:
		pack.clear()
		pack.visible = false
	else:
		pack.visible = true
		pack.show_inventory(inventory)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#clear()		# Очищаем иdнвентарь по старту
	#visible = false		# Скрываем по старту


func update_inventory(inventory):	# Перезагрузить инвентарь
	if pack.visible:
		pack.show_inventory(inventory)

#func _ready():

#
#func clear():		# Очищаем инвентарь
#	for i in hbox.get_children():	# Убираем всех детей
#		hbox.remove_child(i)
#		i.queue_free()

#func show_inventory(inventory):		# Показать инвентарь
#	clear()		# очищаем предыдущий инвентарь на всякий
#	for i in inventory.keys():	# Для каждого ключа в 
#		var newItem = item.instance()
#		container.add_child(newItem)
#		newItem.set_item(i, inventory[i])

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
