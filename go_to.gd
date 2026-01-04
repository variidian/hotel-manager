extends Control
@onready var animation = $AnimationPlayer
@onready var bell = $Sprite2D
@onready var bell_ring = $AudioStreamPlayer
func _ready():
	bell.hide()
func _on_decorate_pressed() -> void:
	get_tree().change_scene_to_file("res://node_2d.tscn")
	print("to decorate scene")
func _on_inside_pressed() -> void:
	get_tree().change_scene_to_file("res://inside.tscn")
	print("to inside hotel")

func _on_advertise_pressed() -> void:
	e.advertisement += 4
	animation.play("advertise")
	bell.show()
	bell_ring.play()
func _process(delta):
	if e.advertisement > 0:
		e.advertisement -= 15 * delta
		return
