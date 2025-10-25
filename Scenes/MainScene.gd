extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var mainmenu = load("res://UIs/MainMenu/MainMenu.tscn").instantiate();
	add_child(mainmenu);
	IntervalHearManager.load_file();
