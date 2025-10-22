extends UIBase

func anim_start():
	$Control.modulate.a = 0;
	$Control.process_mode = PROCESS_MODE_DISABLED;
	$Control.position = Vector2(get_viewport().get_visible_rect().size.x, 0);
	_tween.tween_property($Control, "modulate:a", 1, tween_wait);
	_tween.parallel().tween_property($Control, "position", Vector2(0, 0), tween_wait);
	_tween.tween_property($Control, "process_mode", PROCESS_MODE_INHERIT, 0);
	
func anim_end():
	_tween.tween_property($Control, "modulate:a", 0, tween_wait);
	_tween.parallel().tween_property($Control, "position", Vector2(get_viewport().get_visible_rect().size.x, 0), tween_wait);
	_tween.tween_property($Control, "process_mode", PROCESS_MODE_DISABLED, 0);

func backto_mainmenu() -> void:
	connect("on_exit", change_scene_to_mainmenu);
	exit();

func change_scene_to_mainmenu():
	var mainmenu = preload("res://UIs/MainMenu/MainMenu.tscn").instantiate();
	get_parent().add_child(mainmenu);
