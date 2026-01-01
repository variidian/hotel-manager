extends Control
@onready var review1_text = $review_text
@onready var s1 = $star1
@onready var s2 = $star2
@onready var s3 = $star3
@onready var s4 = $star4
@onready var s5 = $star5
@onready var animation = $AnimationPlayer
@onready var dialogue = preload("res://1star_review.dialogue")
var go_hotel_intro := false
func _ready():
	s1.hide()
	s2.hide()
	s3.hide()
	s4.hide()
	s5.hide()
	animation.play("fade")
	if Timeofday.day == 1 and e.bought_bed and e.bought_bookshelf and e.bought_sign:
		review1_text.text = "This place is SO bad. The aura here is SO off. One star!"
		s1.show()
	elif Timeofday.day == 1 and e.bought_bed and e.bought_bookshelf:
		review1_text.text = "terrible! One star!"
		s1.show()
	elif Timeofday.day == 1 and e.bought_bed and e.bought_sign:
		review1_text.text = "Utterly lacking. One star!"
		s1.show()
	elif Timeofday.day == 1 and e.bought_bed:
		review1_text.text = "No! Just NO. One star!"
		s1.show()
	elif Timeofday.day == 1:
		review1_text.text = "...Disgusting. One star!"
		s1.show()
	elif not e.paid_owner and e.money <= 2000:
		review1_text.text = "I'm still waiting for the money."
		s1.show()
		s2.show()
	elif not e.paid_owner and e.money >= 2000:
		review1_text.text = "It would seem you haven enough funds for the payment."
		s1.show()
		s2.show()
		s3.show()
		e.pay_owner = true
	elif e.paid_owner and not e.marketing_fees:
		review1_text.text = "Hey. We need to talk."
		s1.show()
		s2.show()
		s3.show()
		e.marketing_fees = true
		go_hotel_intro = true
	elif e.amount_of_furniture > 3:
		review1_text.text = "A comfortable amount of furniture here."
		s1.show()
		s2.show()
		s3.show()
		s3.show()
	elif e.amount_of_furniture <= 3 and e.amount_of_furniture > 1:
		review1_text.text = "cozy, but could use a bit more furniture and decorations."
		s1.show()
		s2.show()
		s3.show()
	elif e.amount_of_furniture == 1:
		review1_text.text = "not a lot here. the bed is comfortable though."
	elif e.amount_of_furniture < 1:
		review1_text.text = "theres like.. nothing here."
	else:
		review1_text.text = "huh.."

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	queue_free()
	if Timeofday.day == 1:
		DialogueManager.show_dialogue_balloon(dialogue, "start")
	elif not e.paid_owner and e.money >= 2000:
		get_tree().change_scene_to_file("res://hotel_intro.tscn")
	if go_hotel_intro:
		get_tree().change_scene_to_file("res://hotel_intro.tscn")
		go_hotel_intro = false
