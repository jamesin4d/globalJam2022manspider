extends Spatial
#this is confusing right now cause i've named the interaction hands as container.gd 
# and in the ol inventory add on theres Container.gd which is a treasure box thing.
const KEY_INTERACT: String = 'interact'
const MOUSE_WHEEL_UP: String = 'mouse_wheel_up'
const MOUSE_WHEEL_DOWN: String = 'mouse_wheel_down'
#const DEFAULT_POS: Vector3 = Vector3(0, 0, -1.5)

# Exported (Never update this on runtime)
export(float, 0.0, 100.0, 0.05) var throw_power = 5
export(float, 0.0, 100.0, 0.05) var scroll_speed = 0.05
#export(float, 0.0, 3.0, 0.05) var min_distance = -2.5
#export(float, 0.0, 2.0, 0.05) var max_distance = -0.5

# Nodes
onready var crosshair_ray_cast = get_node('../Crosshair')


# Runtime 
var prop: Protoprop


func _ready():
	pass

func _input(event):
	if event is InputEventMouseButton:
		if Input.is_action_just_pressed(MOUSE_WHEEL_DOWN) and prop:
			translate(Vector3(0, 0, scroll_speed))
		elif Input.is_action_just_pressed(MOUSE_WHEEL_UP) and prop:
			translate(Vector3(0, 0, -scroll_speed))

func _process(_delta):
	# dont detect another object when there is already an object on hand.
	crosshair_ray_cast.enabled = !prop
	set_prop()

# player pickup input.
func set_prop() -> void:
	if Input.is_action_just_pressed(KEY_INTERACT):
		var object = crosshair_ray_cast.get_collider()
		if object is Protoprop and !prop:
			prop = object
			prop.attach(self)
		elif prop is Protoprop:
			prop.detach()
			prop = null

	if prop and prop.prop_container != self:
		prop = null



		

	

