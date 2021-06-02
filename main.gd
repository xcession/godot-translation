extends Control

onready var locale_label = get_node("MainContainer/PanelContainer/CenterContainer/BottomContainer/VBoxContainer/HelloText")
onready var locale_button = get_node("MainContainer/PanelContainer/CenterContainer/BottomContainer/VBoxContainer/HelloButton")

const default_locale = "en_GB"

# Called when the node enters the scene tree for the first time.
func _ready():
	# Set locale to default
	set_locale(default_locale)
	
func _on_English_pressed():
	set_locale("en_GB")

func _on_Spanish_pressed():
	set_locale("es_ES")

func _on_Japanese_pressed():
	set_locale("ja_JP")

func _on_Laos_pressed():
	set_locale("lo_LA")

func _on_Thai_pressed():
	set_locale("th_TH")

func set_locale(locale):
	TranslationServer.set_locale(locale)
	
	var dynamic_font = DynamicFont.new()
	match locale:
		"en_GB":
			dynamic_font.font_data = load("res://fonts/NotoSans-Regular.ttf")
		"es_ES":
			dynamic_font.font_data = load("res://fonts/NotoSans-Regular.ttf")
		"ja_JP":
			dynamic_font.font_data = load("res://fonts/NotoSansCJKjp-Regular.otf")
		"lo_LA":
			dynamic_font.font_data = load("res://fonts/NotoSansLaoUI-Regular.ttf")
		"th_TH":
			dynamic_font.font_data = load("res://fonts/NotoSansThaiUI-Regular.ttf")

	locale_label.add_font_override("font", dynamic_font)
	locale_button.add_font_override("font", dynamic_font)

	print("Current locale is: " + locale)
