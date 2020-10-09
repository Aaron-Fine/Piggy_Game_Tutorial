extends Area2D

var move_vec = Vector2.ZERO
export var SPEED = 50

onready var sprite = $Sprite
onready var animPlayer = $AnimationPlayer
onready var initScale = scale
onready var initSpeed = SPEED

func _process(delta):
	move_vec.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	move_vec.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	move_vec = move_vec.normalized()
	
	move(delta)
	if move_vec.x < 0:
		sprite.flip_h = true
	else:
		sprite.flip_h = false
	
	if move_vec.length_squared() > 0:
		animPlayer.play("Run")
	else:
		animPlayer.play("Idle")
	

func move(delta):
	position += move_vec * SPEED * delta


func _on_Pig_area_entered(area):
	area.queue_free()
	scale *= 1.1
	SPEED += 1
	
func reset_pig():
	scale = initScale
	SPEED = initSpeed
