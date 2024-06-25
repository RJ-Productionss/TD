extends Timer

@onready var path = preload("res://Menu/BG_Objects/flakes.tscn")
@onready var count = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timeout():
	var tmp = path.instantiate()
	if(count <= 7):
		add_child(tmp)
		count = count + 1 
