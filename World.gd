extends Node

onready var apple = preload("res://Apple.tscn")
onready var screen_size = get_viewport().get_visible_rect()
onready var pig = $Pig

func _on_AppleSpawner_timeout():
	spawn_apple()

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		pig.reset_pig()
	if Input.is_action_just_pressed("add_apple"):
		spawn_apple()

func spawn_apple():
	var newApple = apple.instance()
	newApple.position = Vector2(
			rand_range(0, screen_size.size.x), 
			rand_range(0, screen_size.size.y))
	get_tree().current_scene.add_child(newApple)
