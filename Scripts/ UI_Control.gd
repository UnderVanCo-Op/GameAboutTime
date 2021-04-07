extends Control

onready var pack = $NinePanel


func toggle_inventory(inventory):
	if pack.visible:
		pack.clear()
		pack.visible = false
	else:
		pack.visible = true
		pack.show_inventory(inventory)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func update_inventory(inventory):
	if pack.visible:
		pack.show_inventory(inventory)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
