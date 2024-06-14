extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	self.body_entered.connect(_on_Ladder_area_entered)
	self.body_exited.connect(_on_Ladder_area_exited)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on__body_entered(area):
	print(area.name)


# Define the method to handle when the player enters the ladder area
func _on_Ladder_area_entered(area):
	if area.name == "Character":
		area.call("on_ladder_entered", area, get_parent_node_3d())
		# Player entered the ladder area
		# You can add your ladder climbing logic here
		
# Define the method to handle when the player exits the ladder area
func _on_Ladder_area_exited(area):
	if area.name == "Character":
		area.call("on_ladder_exited", area, get_parent_node_3d())
