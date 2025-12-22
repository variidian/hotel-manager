extends Node2D

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "to_room1":
		e.room1_full = false
		queue_free()
	elif anim_name == "to_room2":
		e.room2_full = false
		queue_free()
	elif anim_name == "to_room3":
		e.room3_full = false
		queue_free()
	elif anim_name == "to_room4":
		e.room4_full = false
		queue_free()
	elif anim_name == "to_room5":
		e.room5_full = false
		queue_free()
	elif anim_name == "to_room6":
		e.room6_full = false
		queue_free()
