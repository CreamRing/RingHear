extends UIBase

func anim_start():
	$Control.modulate.a = 0;
	$Control.process_mode = PROCESS_MODE_DISABLED;
	$Control.scale = Vector2(0.5, 0.5);
	_tween.tween_property($Control, "modulate:a", 1, tween_wait);
	_tween.parallel().tween_property($Control, "scale", Vector2(1, 1), tween_wait);
	_tween.tween_property($Control, "process_mode", PROCESS_MODE_INHERIT, 0);

func anim_end():
	_tween.tween_property($Control, "process_mode", PROCESS_MODE_DISABLED, 0);
	_tween.tween_property($Control, "modulate:a", 0, tween_wait);
	_tween.parallel().tween_property($Control, "scale", Vector2(0.5, 0.5), tween_wait);

func goto_interval_test() -> void:
	connect("on_exit", change_scene_to_interval);
	exit();
	
func change_scene_to_interval():
	var interval_ui = preload("res://UIs/IntervalHear/IntervalHear.tscn").instantiate();
	get_parent().add_child(interval_ui);
