extends Node2D

var itemName = ""	# хранит название вещи
var amount = 1		# хранит кол-во предметов с таким названием

func set_item(it_name):		# метод выбирает конкретный айтем по названию
	itemName = it_name
	$Sprite.texture = load("res://Sprites/Items/" + it_name + ".png")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_item():	# геттер для имени
	return itemName

func get_amount():	# геттер для кол-ва
	return amount

func _input(event):
	if event.is_action_pressed("Item_PickUp"):	# Если была нажата кнопка подбора вещи
		var pl = get_parent().get_parent().get_player()		# Ищем игрока
		if abs(pl.position.x - position.x) < 64 && abs(pl.position.y - position.y) < 64: #abs - модуль 
			get_parent().remove_child(self)		# удаляем предмет со сцены
			pl.pick(self)		# подбираем предмет
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
