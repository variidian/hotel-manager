extends Node2D
@onready var bed = $layer_holder/bed
@onready var bookshelf = $layer_holder/bookshelf
@onready var fire_extinguisher = $layer_holder/extinguish
@warning_ignore("shadowed_global_identifier")
@onready var sign = $layer_holder/sign
@onready var animation = $AnimationPlayer
@onready var tutorial_pt1 = $animation
@onready var tutorial_pt2 = $animation_pt2
func _ready():
	if not e.bought_bed:
		bed.hide()
	if not e.bought_bookshelf:
		bookshelf.hide()
	if not e.bought_sign:
		sign.hide()
	if not e.bought_fire_extinguisher:
		fire_extinguisher.hide()
func _process(_float) -> void:
	if e.add_bed and not e.bought_bed:
		bed.show()
		e.bought_bed = true
		if e.tutorial:
			tutorial_pt1.hide()
			alien.play(1)
			animation.play("tutorial_pt2")
			e.tutorial = false
	if e.add_bookshelf and not e.bought_bookshelf:
		e.bought_bookshelf = true
		bookshelf.show()
	if e.add_sign and not e.bought_sign:
		e.bought_sign = true
		sign.show()
	if e.add_fire_extinguisher and not e.bought_fire_extinguisher:
		e.bought_fire_extinguisher = true
		fire_extinguisher.show()
	if e.transition2_finish:
		e.transition2_finish = false
		if e.tutorial:
			alien.play(5)
			animation.play("tutorial")
		if not e.tutorial:
			tutorial_pt1.hide()
			tutorial_pt2.hide()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	alien.stop()
