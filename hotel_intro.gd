extends Node2D
@onready var intro = preload("res://hotel_intro.dialogue")
@onready var one_star_review = preload("res://1star_review_pt2.dialogue")
@onready var transition = $transition_pt1/AnimationPlayer
@onready var sprite = $transition_pt1/Sprite2D
@onready var other_hotel_owner = $Sprite2D2
@onready var pay_owner = preload("res://pay_owner.dialogue")
@onready var marketing_fees = $random_fees
@onready var pay_marketing_fees = preload("res://marketing_fees.dialogue")
func _ready():
	sprite.show()
	other_hotel_owner.hide()
	marketing_fees.hide()
	transition.stop()
	transition.play("transition2", 0.0)
func _process(_float) -> void:
	if e.transition2_finish:
		if e.checkoutside:
			DialogueManager.show_dialogue_balloon(one_star_review, "start")
			other_hotel_owner.show()
			e.transition2_finish = false
		elif e.pay_owner:
			DialogueManager.show_dialogue_balloon(pay_owner, "start")
			other_hotel_owner.show()
			e.transition2_finish = false
			e.paid_owner = true
		elif e.marketing_fees:
			DialogueManager.show_dialogue_balloon(pay_marketing_fees, "start")
			e.transition2_finish = false
		else:
			DialogueManager.show_dialogue_balloon(intro, "start")
			e.transition2_finish = false
	if e.transition_finish and not e.checkoutside and not e.pay_owner:
		e.transition_finish = false
		get_tree().change_scene_to_file("res://node_2d.tscn")
	if e.hotel_intro_ended and not e.checkoutside and not e.pay_owner:
		transition.play("transition1")
