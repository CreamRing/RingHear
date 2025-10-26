extends UIBase

const note_name_list = [
	"C",
	"D",
	"E",
	"F",
	"G",
	"A",
	"B"
];

const alter_list = [
	"♮",
	"#",
	"b"
]

func _ready() -> void:
	super._ready();
	if (IntervalHearManager.note_highest != ""):
		sync_highest();
		sync_lowest();
		
func sync_highest():
	var text = IntervalHearManager.note_highest;
	var n;
	var a;
	var o: String;
	if (text.length() == 3):
		n = text[0];
		a = text[1];
		o = text[2];
	else:
		n = text[0];
		o = text[1];
		a = "♮";
		
	$Control/Highest/Alter.selected = alter_list.find(a);
	$Control/Highest/Name.selected = note_name_list.find(n);
	$Control/Highest/Octave.selected = o.to_int();
		
func sync_lowest():
	var text = IntervalHearManager.note_lowest;
	var n;
	var a;
	var o: String;
	if (text.length() == 3):
		n = text[0];
		a = text[1];
		o = text[2];
	else:
		n = text[0];
		o = text[1];
		a = "♮";
		
	$Control/Lowest/Alter.selected = alter_list.find(a);
	$Control/Lowest/Name.selected = note_name_list.find(n);
	$Control/Lowest/Octave.selected = o.to_int();

func anim_start():
	$Control.modulate.a = 1;
	$Control.process_mode = PROCESS_MODE_DISABLED;
	$Control.position = Vector2(-get_viewport().get_visible_rect().size.x, 0);
	_tween.parallel().tween_property($Control, "position", Vector2(0, 0), tween_wait);
	_tween.tween_property($Control, "process_mode", PROCESS_MODE_INHERIT, 0);
	
func anim_end():
	_tween.parallel().tween_property($Control, "position", Vector2(-get_viewport().get_visible_rect().size.x, 0), tween_wait);
	_tween.tween_property($Control, "process_mode", PROCESS_MODE_DISABLED, 0);

func backto_config() -> void:
	var note_h: NoteHeight = NoteHeight.new();
	var note_l: NoteHeight = NoteHeight.new();
	
	var n = $Control/Highest/Name.get_item_text($Control/Highest/Name.selected);
	var a = "";
	if ($Control/Highest/Alter.get_item_text($Control/Highest/Alter.selected) != "♮"):
		a = $Control/Highest/Alter.get_item_text($Control/Highest/Alter.selected);
	var o = $Control/Highest/Octave.get_item_text($Control/Highest/Octave.selected);
	note_h.set_name(str(n + a + o));
	IntervalHearManager.note_highest = str(n + a + o) ;
	
	a = "";
	n = $Control/Lowest/Name.get_item_text($Control/Lowest/Name.selected);
	if ($Control/Lowest/Alter.get_item_text($Control/Lowest/Alter.selected) != "♮"):
		a = $Control/Lowest/Alter.get_item_text($Control/Lowest/Alter.selected);
	o = $Control/Lowest/Octave.get_item_text($Control/Lowest/Octave.selected);
	note_l.set_name(str(n + a + o));
	IntervalHearManager.note_lowest = str(n + a + o);
	
	if (note_h.number <= note_l.number):
		var ad: AcceptDialog = AcceptDialog.new();
		ad.title = "不对不对~";
		ad.dialog_text = "最高音不能低于最低音啊，傻瓜";
		ad.ok_button_text = "我知道了";
		get_tree().current_scene.add_child(ad);
		ad.popup_centered(Vector2i(300, 150));
		return;
	
	IntervalHearManager.save_file();
	
	connect("on_exit", change_scene_to_intervalconfig);
	exit();

func change_scene_to_intervalconfig():
	var interval_confige = load("uid://cjb3chmryisy3").instantiate();
	get_parent().add_child(interval_confige);
