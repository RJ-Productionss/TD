extends CharacterBody2D
var target
var speed = 100
var pathBase = ""
var bulletDamage
var pathSpawnerNode
var enemi


# Called when the node enters the scene tree for the first time.
func _ready():
	pathSpawnerNode = get_tree().get_root().get_node("Map/Spawner")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print("gecisnyak ", enemi.name)
	if((!is_instance_valid(enemi) || "StaticBody2D" in enemi.name) && get_parent().get_parent().get_node("BulletContainer").get_child_count() > 0 ):
		for a in get_parent().get_parent().get_node("BulletContainer").get_child_count():
							get_parent().get_parent().get_node("BulletContainer").get_child(a).queue_free()
		queue_free()
	pathSpawnerNode = get_tree().get_root().get_node("Map/Spawner")
func _physics_process(delta):
	print(get_tree().get_root().get_node("Map/Spawner"))
	#if(pathSpawnerNode.get_child_count() < 1):
	if(is_instance_valid(pathSpawnerNode)):
		
		
		for i in pathSpawnerNode.get_child_count():
			print(pathSpawnerNode.get_child_count())
			
			print("csajld: " + pathSpawnerNode.get_child(i).name)
			if pathSpawnerNode.get_child(i).name == pathBase:
				target = pathSpawnerNode.get_child(i).get_child(0).get_child(0).global_position
				print("fasz " + pathSpawnerNode.get_child(i).get_child(0).name)
				print("a: " + pathSpawnerNode.get_child(i).get_child(0).get_child(0).name)
				if !is_instance_valid(enemi):
					if is_instance_valid(get_parent().get_parent().get_node("BulletContainer")) :
						for a in get_parent().get_parent().get_node("BulletContainer").get_child_count():
							get_parent().get_parent().get_node("BulletContainer").get_child(a).queue_free()
					
					print("enem ",is_instance_valid(enemi))
				
				velocity = global_position.direction_to(target) *speed
				look_at(target)
				print("geci", enemi)
		move_and_slide()




func _on_area_2d_body_entered(body):
	if(target != null):
		enemi = body;
		if "Enemy" in body.name:
			body.Health -= bulletDamage
			self.queue_free()
