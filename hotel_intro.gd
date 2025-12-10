extends Node2D
@onready var intro = preload("res://hotel_intro.dialogue")
func _ready():
	DialogueManager.show_dialogue_balloon(intro, "start")
