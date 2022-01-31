extends State


export var is_paused := false
export var pause_texture := NodePath()
onready var _texture: TextureRect = get_node(pause_texture)
#recieves events from _unhandled_input() callbakc
func handle_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		is_paused = !is_paused
		emit_signal("gamepaused")
		
func update(_delta) -> void:
	if is_paused:
		_texture.show()
	else:
		_texture.hide()
