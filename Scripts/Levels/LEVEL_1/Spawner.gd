extends Timer

@onready var path = preload("res://Scripts/Levels/map_1_sp.tscn")
@onready var tao = preload("res://Scripts/Levels/map_1_tao.tscn")
@onready var count = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timeout():
	if(count == 10):
		var tao = tao.instantiate()
		add_child(tao)
		tao.add_to_group("Enemy")
	else:
		var tmp = path.instantiate()
		add_child(tmp)
		tmp.add_to_group("Enemy")
	count += 1 
