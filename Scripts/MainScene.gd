extends Node2D

onready var item = preload("res://Scenes/Item.tscn")	# Предзагрузка префаба айтема
var itemList = ["Key", "Key2"]		# Список всех доступных айтемов

# Called when the node enters the scene tree for the first time.
func _ready():
	ItemGen()	# Запускаем рандомную генерацию айтемов
   
func ItemGen():
	for	_i in range (5):						# создаем 5 обьектов 
		var new_item = item.instance()
		$Items.add_child(new_item)		# Добавляем ребенка Пустышке Items внутри MainScene
		new_item.set_item(itemList[rand_range(0,2)])	# Рандомно назначаем этого ребенка из списка айтемов 
		randomize()		# Функция рандомизирует rand_range (берёт текущее время по дефолту)
		new_item.position = Vector2(int(rand_range(0, 1000)), int(rand_range(0, 1000)))	# Устанавливаем позицию рандомно
	
func get_player():
	return $Player	# геттер игрока

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
