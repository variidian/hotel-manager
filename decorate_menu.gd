extends Control
@onready var moneyamount = $RichTextLabel
@onready var transition = $transition_pt1/AnimationPlayer
@onready var sprite = $transition_pt1/Sprite2D
func _on_button_pressed() -> void: #bed purchase
	if not e.bought_bed:
		if e.money >= 800:
			e.money -= 800
			e.add_bed = true
			e.amount_of_furniture += 1
func _process(_float) -> void:
	moneyamount.text = "coins:	" + str(e.money)


func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://hotel_outside.tscn")


func _on_button_2_pressed() -> void: #bookshelf purchase
	if e.bought_bed and not e.bought_bookshelf:
		if e.money >= 1200:
			e.money -= 1200
			e.add_bookshelf = true
			e.amount_of_furniture += 1

func _on_button_3_pressed() -> void: #sign purchase
	if e.bought_bed and not e.bought_sign:
		if e.money >= 900:
			e.money -= 900
			e.add_sign = true
			e.amount_of_furniture += 1

func _ready():
	sprite.show()
	transition.play("transition2")
