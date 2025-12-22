extends Node2D
@onready var transition = $transition_pt1/AnimationPlayer
@onready var sprite = $transition_pt1/Sprite2D
@onready var bunny_preload = preload("res://bunny_inside.tscn")
func _ready():
	sprite.show()
	transition.play("transition2")
func _process(_float) -> void:
	if not e.room1_full:
		var bunny = bunny_preload.instantiate()
		add_child(bunny)
		var animation = bunny.get_node("AnimationPlayer")
		animation.play("to_room1")
		e.room1_full = true
	if not e.room2_full:
		var bunny = bunny_preload.instantiate()
		add_child(bunny)
		var animation = bunny.get_node("AnimationPlayer")
		animation.play("to_room2")
		e.room2_full = true
	if not e.room3_full:
		var bunny = bunny_preload.instantiate()
		add_child(bunny)
		var animation = bunny.get_node("AnimationPlayer")
		animation.play("to_room3")
		e.room3_full = true
	if not e.room4_full:
		var bunny = bunny_preload.instantiate()
		add_child(bunny)
		var animation = bunny.get_node("AnimationPlayer")
		animation.play("to_room4")
		e.room4_full = true
	if not e.room5_full:
		var bunny = bunny_preload.instantiate()
		add_child(bunny)
		var animation = bunny.get_node("AnimationPlayer")
		animation.play("to_room5")
		e.room5_full = true
	if not e.room6_full:
		var bunny = bunny_preload.instantiate()
		add_child(bunny)
		var animation = bunny.get_node("AnimationPlayer")
		animation.play("to_room6")
		e.room6_full = true
