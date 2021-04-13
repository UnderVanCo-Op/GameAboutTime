extends Control

onready var pack = $NinePanel	# Хранит ссыль на ninePanel
onready var downbar = $UI_DownBar	# Хранит ссыль на DownBar

func toggle_inventory(inventory):	# Метод переключения видимости инвентаря
	print("toggle_inv worked")
	if pack.visible:
		pack.clear()
		pack.visible = false
	else:
		pack.visible = true
		pack.show_inventory(inventory)

func _ready():
	pass

func update_inventory(inventory):	# Перезагрузить инвентарь
	if pack.visible:
		pack.show_inventory(inventory)
