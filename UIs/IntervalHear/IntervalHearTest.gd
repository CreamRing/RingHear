extends UIBase

func anim_start():
	$Control.modulate.a = 0;
	$Control.process_mode = PROCESS_MODE_DISABLED;
	_tween.tween_property($Control, "modulate:a", 1, tween_wait);
	_tween.tween_property($Control, "process_mode", PROCESS_MODE_INHERIT, 0);
	
func anim_end():
	_tween.tween_property($Control, "modulate:a", 0, tween_wait);
	_tween.tween_property($Control, "process_mode", PROCESS_MODE_DISABLED, 0);

func give_up() -> void:
	connect("on_exit", func(): 
		var interval_selector = load("uid://cjb3chmryisy3").instantiate();
		get_parent().add_child(interval_selector);
	);
	exit();
