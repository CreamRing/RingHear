extends UIBase

func anim_start():
	$Control.modulate.a = 1;
	$Control.process_mode = PROCESS_MODE_DISABLED;
	$Control.position = Vector2(get_viewport().get_visible_rect().size.x, 0);
	_tween.parallel().tween_property($Control, "position", Vector2(0, 0), tween_wait);
	_tween.tween_property($Control, "process_mode", PROCESS_MODE_INHERIT, 0);

func _process(delta: float) -> void:
	$Control/OptionsScroll/OptionsBox/IntervalSelector.text = str(tr("音程选择  ") + str(len(IntervalHearManager.properties)));
	$Control/OptionsScroll/OptionsBox/RangeSelector.text = str(tr("音高范围选择  ") + IntervalHearManager.note_lowest + "-" + IntervalHearManager.note_highest);

func anim_end():
	_tween.parallel().tween_property($Control, "position", Vector2(get_viewport().get_visible_rect().size.x, 0), tween_wait);
	_tween.tween_property($Control, "process_mode", PROCESS_MODE_DISABLED, 0);

func backto_mainmenu() -> void:
	connect("on_exit", change_scene_to_mainmenu);
	exit();
	
func change_scene_to_mainmenu():
	var mainmenu = load("uid://bsogr3yqigt3g").instantiate();
	get_parent().add_child(mainmenu);

func goto_interval_selector() -> void:
	connect("on_exit", change_scene_to_interval_selector);
	exit();

func change_scene_to_interval_selector():
	var interval_selector = load("uid://cidqm1l7p2iil").instantiate();
	get_parent().add_child(interval_selector);
	
func change_scene_to_interval_rangeselector():
	var interval_selector = load("uid://dqtbc41xm4dyq").instantiate();
	get_parent().add_child(interval_selector);

func goto_interval_rangeselector() -> void:
	connect("on_exit", change_scene_to_interval_rangeselector);
	exit();

func start_test() -> void:
	connect("on_exit", func(): 
		var interval_selector = load("uid://d06snlge6oonl").instantiate();
		get_parent().add_child(interval_selector);
	);
	exit();
