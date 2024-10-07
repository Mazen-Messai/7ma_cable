extends Node

# Getting all the child nodes
@onready var TOPBAR = get_node("UI/TopBar")
@onready var LEFTBAR = get_node("UI/LeftBar")
@onready var EDITINGZONE = get_node("UI/EditingZone")

# Getting screen constants
@onready var screenWidth = DisplayServer.screen_get_size().x
@onready var screenHeight = DisplayServer.screen_get_size().y

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	# Updating the new window size	
	var windowWidth = DisplayServer.window_get_size().x
	var windowHeight = DisplayServer.window_get_size().y
	
	# Calculating the zones sizes
	var topBarHeight = windowHeight * 0.05
	var leftBarWidth = windowWidth * 0.25
	
	# Updating the Top Bar size
	TOPBAR.set_size(Vector2(windowWidth,topBarHeight))
	TOPBAR.get_child(0).set_size(Vector2(windowWidth, topBarHeight))
	
	# Updating the Left Bar size
	LEFTBAR.set_size(Vector2(leftBarWidth, windowHeight-topBarHeight))
	LEFTBAR.set_global_position(Vector2(0,topBarHeight))
	LEFTBAR.get_child(0).set_size(Vector2(leftBarWidth, windowHeight-topBarHeight))
	
	# Updating the Editing zone size
	EDITINGZONE.set_size(Vector2(windowWidth - leftBarWidth, windowHeight - topBarHeight))
	EDITINGZONE.set_global_position(Vector2(leftBarWidth, topBarHeight))
