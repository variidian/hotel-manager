extends Node
var hotel_intro_ended:bool = false
var add_bed:bool = false
var add_bookshelf:bool = false
var add_sign: bool = false
var money = int(0)
var tutorial:bool = true
var bought_bed:bool = false
var bought_bookshelf: bool = false
var bought_sign: bool = false
var advertisement = int(0)
var customers = int(0)
var transition_finish := false
var transition2_finish := false
var hide_tutorial := false
var room1_full := false
var room2_full := false
var room3_full := false
var room4_full := false
var room5_full := false
var room6_full := false
var played_tutorial := false
var review = 0
var checkoutside := false
var advertisement_multiplier: float = 1.0
var prevent := false
var pay_owner := false
var paid_owner := false
var marketing_fees := false
var amount_of_furniture = 0
func fish():
	get_tree().change_scene_to_file("res://hotel_intro.tscn")
func to_hotel_outside():
	get_tree().change_scene_to_file("res://hotel_outside.tscn")
	e.room1_full = false
	e.room2_full = false
	e.room3_full = false
	e.room4_full = false
	e.room5_full = false
	e.room6_full = false
