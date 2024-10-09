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
@onready var resizeHandleSize = windowHeight * 0.05

# Creating constants to resize the leftbar
@onready var isLeftBarBeingResized = false

func _ready() -> void:
	DisplayServer.window_set_min_size(Vector2(1000,610))
	
	#Initalizing LeftBar and Editing Zone sizes
	LEFTBAR.set_size(Vector2(leftBarWidth, windowHeight-topBarHeight))
	LEFTBAR.set_global_position(Vector2(0,topBarHeight))
	LEFTBAR.get_child(-1).set_size(Vector2(leftBarWidth, windowHeight-topBarHeight))
	
	EDITINGZONE.set_size(Vector2(windowWidth - leftBarWidth, windowHeight - topBarHeight))
	EDITINGZONE.set_global_position(Vector2(leftBarWidth, topBarHeight))

func _process(delta: float) -> void:
	# Updating the new window size	
	windowWidth = DisplayServer.window_get_size().x
	windowHeight = DisplayServer.window_get_size().y
	
	# Calculating the zones sizes
	topBarHeight = windowHeight * 0.05
	
	if isLeftBarBeingResized :
		if windowWidth*0.1 <= get_viewport().get_mouse_position().x and get_viewport().get_mouse_position().x <= windowWidth/2 :
			leftBarWidth = get_viewport().get_mouse_position().x
		elif get_viewport().get_mouse_position().x < windowWidth*0.1 :
			leftBarWidth = windowWidth*0.1
		else :
			leftBarWidth = windowWidth/2
	
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
	RESIZEHANDLE.set_global_position(Vector2(leftBarWidth-resizeHandleSize/2, windowHeight/2))
	RESIZEHANDLE.set_size(Vector2(resizeHandleSize,resizeHandleSize))


func _on_resize_handle_button_down() -> void:
	isLeftBarBeingResized = true
	print(isLeftBarBeingResized)


func _on_resize_handle_button_up() -> void:
	isLeftBarBeingResized = false
	print(isLeftBarBeingResized)
