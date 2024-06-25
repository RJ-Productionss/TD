extends StaticBody2D
var bullet = preload("res://Scripts/Towers/kiblast.tscn")
var bulletdmg = 2
var pathBase
var currTarget = []
var curr
var bodi

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_instance_valid(curr):
		self.look_at(curr.global_position)
	else:
		for i in get_node("BulletContainer").get_child_count():
			get_node("BulletContainer").get_child(i).queue_free()


func _on_tower_body_entered(body):
	print(body.name)
	bodi = body
	if "Enemy" in body.name:
		var tmpArray = []
		currTarget = get_node("Tower").get_overlapping_bodies()
		
		for i in currTarget:
			if "Enemy" in i.name:
				tmpArray.append(i)
		var currTarget = null
		
		for i in tmpArray:
			if currTarget == null:
				currTarget = i.get_node("../")
			else:
				if i.get_parent().get_progress() > currTarget.get_progress():
					currTarget = i.get_node("../")
		curr = currTarget
		print("b: " + currTarget.name)
		pathBase = currTarget.name
		if (pathBase != null):
			var tempBullet = bullet.instantiate()
			tempBullet.pathBase = pathBase
			tempBullet.bulletDamage = bulletdmg
			get_node("BulletContainer").add_child(tempBullet)
			tempBullet.global_position = $Aim.global_position		


func _on_tower_body_exited(body):
	currTarget = get_node("Tower").get_overlapping_bodies()
	


func _on_timer_timeout():
	if (is_instance_valid(bodi)):
		var tempBullet = bullet.instantiate()
		tempBullet.pathBase = pathBase
		tempBullet.bulletDamage = bulletdmg
		tempBullet.enemi = curr
		get_node("BulletContainer").add_child(tempBullet)
		tempBullet.global_position = $Aim.global_position
