extends Node2D

var speed = 15
var isSpinning = false
var selected

@onready var timer = $"../Timer"
@onready var wheel = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	isSpinning = false
	
func _physics_process(delta: float) -> void:
	if speed <= 0:
		isSpinning = false
		timer.stop()
	if isSpinning == true:
		wheel.rotation_degrees += speed
	else:
		isSpinning = false
		
		
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	spin()
	
func spin():
	if isSpinning == false:
		randomize()
		speed = randf_range(30,35)
		isSpinning = true
		timer.start()


func _on_timer_timeout() -> void:
	if speed <= 0.5:
		speed -= 0.02
	elif speed <= 2:
		speed -= 0.08
	elif speed <= 5:
		speed -= 0.5
	else:
		speed -= 1
	if speed <= 0:
		print("Selected: ", selected)



func _on__area_enteredA(area) -> void:
	selected = "A"
func _on__area_enteredB(area) -> void:
	selected = "B"
func _on__area_enteredC(area) -> void:
	selected = "C"
func _on__area_enteredD(area) -> void:
	selected = "D"
