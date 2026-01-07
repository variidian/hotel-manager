extends Control
@onready var moneyamount = $RichTextLabel
@onready var transition = $transition_pt1/AnimationPlayer
@onready var sprite = $transition_pt1/Sprite2D
@onready var too_broke_text = $too_broke
@onready var animation = $AnimationPlayer
func _on_button_pressed() -> void: #bed purchase
	click.play()
	if not e.bought_bed:
		if e.money >= 800:
			e.money -= 800
			e.add_bed = true
			e.amount_of_furniture += 1
		elif e.money <= 800:
			play_too_broke_animation()
func _process(_float) -> void:
	moneyamount.text = "coins:	" + str(e.money)


func _on_exit_pressed() -> void:
	click.play()
	get_tree().change_scene_to_file("res://hotel_outside.tscn")


func _on_button_2_pressed() -> void: #bookshelf purchase
	click.play()
	if e.bought_bed and not e.bought_bookshelf:
		if e.money >= 1200:
			e.money -= 1200
			e.add_bookshelf = true
			e.amount_of_furniture += 1
		elif e.money <= 1200:
			play_too_broke_animation()

func _on_button_3_pressed() -> void: #sign purchase
	click.play()
	if e.bought_bed and not e.bought_sign:
		if e.money >= 900:
			e.money -= 900
			e.add_sign = true
			e.amount_of_furniture += 1
		elif e.money <= 900:
			play_too_broke_animation()

func _ready():
	sprite.show()
	transition.play("transition2")
	too_broke_text.hide()
func play_too_broke_animation():
	too_broke_text.show()
	animation.play("not_enough_money")


func _on_button_4_pressed() -> void: #fire extinguisher purchase
	click.play()
	if e.bought_bed and not e.bought_fire_extinguisher:
		if e.money >= 500:
			e.money -= 500
			e.add_fire_extinguisher = true
			e.amount_of_furniture += 1
		elif e.money <= 500:
			play_too_broke_animation()
