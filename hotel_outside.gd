extends Node2D
@onready var timer = $Timer
@onready var npc_preload = preload("res://npc.tscn")
@onready var timer2 = $advertisements
@onready var transition = $transition_pt1/AnimationPlayer
@onready var sprite = $transition_pt1/Sprite2D
@onready var tutorial_animation = $AnimationPlayer
@onready var tutorial = $tutorial
@onready var red_sprite = $red
@onready var broke_text = $R
var npc
var timerstarted: bool = false
var advertisement_timerstarted: bool = false
func _ready():
	sprite.show()
	red_sprite.hide()
	broke_text.hide()
	transition.play("transition2")
	if e.hide_tutorial:
		tutorial.hide()
func _process(_float) -> void:
	if not timerstarted:
		timer.start()
		timerstarted = true
	if e.advertisement > 25 and not advertisement_timerstarted:
		timer2.start()
		advertisement_timerstarted = true
	if e.transition2_finish:
		e.transition2_finish = false
		tutorial_animation.play("tutorial")
	if e.money <= -500:
		red_sprite.show()
		broke_text.show()
		tutorial_animation.play("too_broke")
		print("v broke")
func _on_timer_timeout() -> void:
	timerstarted = false
	npc = npc_preload.instantiate()
	add_child(npc)
	e.customers += 1

func _on_advertisements_timeout() -> void:
	npc = npc_preload.instantiate()
	add_child(npc)
	e.customers += 1
	advertisement_timerstarted = false


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	e.hide_tutorial = true
	if anim_name == "too_broke":
		get_tree().quit()
		print("quit game")
