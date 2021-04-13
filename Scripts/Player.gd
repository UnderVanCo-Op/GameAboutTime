extends KinematicBody2D

onready var ui = get_viewport().get_node("Root/UI/FullRectTrue") #interface reference

var step : int = 20		# размер шага
var itemsCount : int = 0	# Кол-во вещей в инвентаре
var vel = Vector2()			# speed (velocity)
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
		vel.x -= step
	elif Input.is_action_pressed("Player_goright"):
		vel.x += step
	if Input.is_action_pressed("Player_goup"):
		vel.y -= step
	elif Input.is_action_pressed("Player_godown"):
		vel.y += step
	vel.y *= 0.9
	vel.x *= 0.9
	if (vel.x < 0):		# Флип для спрайта
		PlayerSprite.flip_h = true
	if (vel.x > 0):		# Флип для спрайта
		PlayerSprite.flip_h = false
	
	vel = move_and_slide(vel, Vector2.UP)	# Плавно перемещаться
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
