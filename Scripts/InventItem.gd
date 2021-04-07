extends TextureRect

func set_item(item_name, amount):
	texture = load("res://Sprites/Items/" + str(item_name) + ".png")
	$Amount.text = str(amount)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
