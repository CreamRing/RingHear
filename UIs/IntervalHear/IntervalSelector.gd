extends UIBase

func anim_start():
	$Control.modulate.a = 1;
	$Control.process_mode = PROCESS_MODE_DISABLED;
	$Control.position = Vector2(-get_viewport().get_visible_rect().size.x, 0);
	_tween.parallel().tween_property($Control, "position", Vector2(0, 0), tween_wait);
	_tween.tween_property($Control, "process_mode", PROCESS_MODE_INHERIT, 0);
	
func anim_end():
	_tween.parallel().tween_property($Control, "position", Vector2(-get_viewport().get_visible_rect().size.x, 0), tween_wait);
	_tween.tween_property($Control, "process_mode", PROCESS_MODE_DISABLED, 0);

func back_page() -> void:
	connect("on_exit", change_scene_to_interval_config);
	exit();

func change_scene_to_interval_config():
	var interval_confige = load("uid://cjb3chmryisy3").instantiate();
	get_parent().add_child(interval_confige);
