extends Node3D

@export var DOOR_ANIMATION : AnimationPlayer

var isOpened : bool = false
var canOpen : bool = false
var openedDir = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	DOOR_ANIMATION.play("RESET")
	self.get_node("Area3D").body_entered.connect(_on_door_enter_side1)
	self.get_node("Area3D2").body_entered.connect(_on_door_enter_side2)
	self.get_node("Area3D").body_exited.connect(_on_door_exit_side1)
	self.get_node("Area3D2").body_exited.connect(_on_door_exit_side2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
var resetCount : float = 10
var timer : float = 0
func _process(delta):
	if isOpened:
		timer += delta
	if timer >= resetCount:
		timer = 0
		isOpened = false
		if openedDir == 1:
			DOOR_ANIMATION.play_backwards("DoorOpen1")
		else:
			DOOR_ANIMATION.play_backwards("DoorOpen2")
	
	if canOpen and Input.is_action_pressed("opendoor"):
		openDoor()
		

func _on_door_enter_side1(node):
	if node.name == "Character":
		openedDir = 1
		canOpen = true
		
func _on_door_enter_side2(node):
	if node.name == "Character":
		openedDir = 2
		canOpen = true
		
func _on_door_exit_side1(node):
	if node.name == "Character":
		canOpen = false
		
func _on_door_exit_side2(node):
	if node.name == "Character":
		canOpen = false
	
func openDoor():
	if !isOpened:
		if openedDir == 1:
			DOOR_ANIMATION.play("DoorOpen1")
		else:
			DOOR_ANIMATION.play("DoorOpen2")
		isOpened = true
