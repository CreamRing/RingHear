extends CanvasLayer
class_name UIBase

static var tween_wait = 0.2;

var _tween: Tween;

signal on_exit;

func _ready() -> void:
	_tween = create_tween();
	_tween.set_trans(Tween.TRANS_SINE);
	_tween.set_ease(Tween.EASE_IN_OUT);
	anim_start()

func anim_start():
	pass
	
func anim_end():
	pass

func exit():
	_tween = create_tween();
	_tween.set_trans(Tween.TRANS_SINE);
	_tween.set_ease(Tween.EASE_IN_OUT);
	anim_end();
	_tween.tween_callback(queue_free);
	emit_signal("on_exit");
