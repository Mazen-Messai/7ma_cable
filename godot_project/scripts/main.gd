extends Node

# Getting all the child nodes
@onready var TOPBAR = get_node("UI/TopBar")
@onready var LEFTBAR = get_node("UI/LeftBar")
@onready var EDITINGZONE = get_node("UI/EditingZone")
@onready var RESIZEHANDLE = get_node("UI/ResizeHandle")

# Getting screen constants
@onready var screenWidth = DisplayServer.screen_get_size().x
@onready var screenHeight = DisplayServer.screen_get_size().y
@onready var windowWidth = DisplayServer.window_get_size().x
@onready var windowHeight = DisplayServer.window_get_size().y

# Initalizing the zone sizes
@onready var topBarHeight = windowHeight * 0.05
@onready var leftBarWidth = windowWidth * 0.25
@onready var resizeHandleSize = windowHeight * 0.1

# Creating constants to resize the leftbar
@onready var isEditingZoneBeingResized = false


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	# Updating the new window size	
	windowWidth = DisplayServer.window_get_size().x
	windowHeight = DisplayServer.window_get_size().y
	
	# Calculating the zones sizes
	topBarHeight = windowHeight * 0.05
	leftBarWidth = windowWidth * 0.25
	# Updating the Top Bar size
	TOPBAR.set_size(Vector2(windowWidth,topBarHeight))
	TOPBAR.get_child(-1).set_size(Vector2(windowWidth, topBarHeight))
	
	# Updating the Left Bar size
	LEFTBAR.set_size(Vector2(leftBarWidth, windowHeight-topBarHeight))
	LEFTBAR.set_global_position(Vector2(0,topBarHeight))
	LEFTBAR.get_child(-1).set_size(Vector2(leftBarWidth, windowHeight-topBarHeight))
	
	# Updating the Editing zone size
	EDITINGZONE.set_size(Vector2(windowWidth - leftBarWidth, windowHeight - topBarHeight))
	EDITINGZONE.set_global_position(Vector2(leftBarWidth, topBarHeight))
	
	# Updating the Resize Handle size and position
	RESIZEHANDLE.set_global_position(Vector2(leftBarWidth, windowHeight/2))
	RESIZEHANDLE.set_size(Vector2(resizeHandleSize,resizeHandleSize))


func _on_resize_handle_toggled(toggled_on: bool) -> void:
	print("Si ca marche pas j'explose mon crane")


func _on_resize_handle_mouse_entered() -> void:
	print("AAAAAAAAAA")


func _on_resize_handle_gui_input(event: InputEvent) -> void:
	print("BBBBBBBBB")


func _on_resize_handle_focus_entered() -> void:
	print("CCCCCCCC")


func _on_resize_handle_mouse_exited() -> void:
	print("DDDDDDDD")


func _on_resize_handle_focus_exited() -> void:
	print("EEEEEEEEE")


func _on_resize_handle_pressed() -> void:
	print("FFFFFFFFFF")
