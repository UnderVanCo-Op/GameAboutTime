extends KinematicBody2D

onready var ui = get_viewport().get_node("Root/UI/FullRect") #interface reference

var step : int = 20		# размер шага
var itemsCount : int = 0	# Кол-во вещей в инвентаре
var speed = Vector2()			# скорость (velocity)
var inventory = {}		# Лист вещей в инвентаре

onready var PlayerSprite = get_node("Sprite")	# Спрайт игрока

func pick(item):	# метод подбора вещи
	#itemsCount += 1
	#print("Item count: ", str(itemsCount))
	var itName = item.get_item()
	if itName in inventory.keys():	# Если такой предмет уже есть, то добавить кол-во
		inventory[itName] += item.get_amount()	
	else:
		inventory[itName] =  item.get_amount()	# Если такого предмета нет, то добавить новый с нужным кол-вом
	ui.update_inventory(inventory)	# обновить инвентарь
	
func _physics_process(_delta):
	if Input.is_action_pressed("Player_goleft"):
		speed.x -= step
	elif Input.is_action_pressed("Player_goright"):
		speed.x += step
	if Input.is_action_pressed("Player_goup"):
		speed.y -= step
	elif Input.is_action_pressed("Player_godown"):
		speed.y += step
	speed.y *= 0.9	# снижение скорости
	speed.x *= 0.9	# снижение скорости
	if (speed.x < 0):		# Флип для спрайта
		PlayerSprite.flip_h = true
	if (speed.x > 0):		# Флип для спрайта
		PlayerSprite.flip_h = false
	#if(speed.length() > step):	# возможный фикс диагональной проблемы
		#speed.normalized()
	speed = move_and_slide(speed, Vector2.UP)	# Плавно перемещаться
	position.x = clamp(position.x, 50, 1920)	# Границы мира
	position.y = clamp(position.y, 20, 1055)	# Границы мира

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _unhandled_input(event):
	if event.is_action_pressed("Inventory_Open"):
		ui.toggle_inventory(inventory)	# Включить показ инвентаря

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
