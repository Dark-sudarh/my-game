extends CharacterBody2D

var input_movement = Vector2.ZERO
var speed = 70

func move():
	input_movement = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	
	if input_movement !=Vector2.ZERO:
		
	
