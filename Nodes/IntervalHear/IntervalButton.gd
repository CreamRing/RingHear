extends CheckButton

func _ready() -> void:
	connect("toggled", select);
	if (IntervalHearManager.properties.has(name) || IntervalHearManager.property_anwsers.has(text)):
		button_pressed = true;
	else:
		button_pressed = false;

func select(toggled_on: bool):
	if (toggled_on):
		if (!IntervalHearManager.properties.has(name)):
			IntervalHearManager.properties.append(name);
		if (!IntervalHearManager.property_anwsers.has(text)):
			IntervalHearManager.property_anwsers.append(text);
	else:
		IntervalHearManager.properties = IntervalHearManager.properties.filter(func(item): return item != name);
		IntervalHearManager.property_anwsers = IntervalHearManager.property_anwsers.filter(func(item): return item != text);
	IntervalHearManager.save_file();
