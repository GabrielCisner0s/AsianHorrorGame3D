extends Node3D

const TRAVEL_TIME :=0.3

#NODOS RAYCAST
@onready var front_ray:= $FrontRay
@onready var back_ray:= $BackRay

#NODO ANIMATION
@onready var animation:= $Animation

#INTERPOLACION
var tween



func _physics_process(_delta):
	if tween is Tween:
		
		if tween.is_running():
			
			return
	
	#CODIGO DE MOVIMIENTO
	if Input.is_action_pressed("forward") and not front_ray.is_colliding():#si me muevo para adelante y NOT hay una pared adelante. Entonces puedo Moverme
		tween= create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		tween.tween_property(self,"transform", transform.translated(-$Camera3D.get_global_transform().basis.z * 2),TRAVEL_TIME)
		animation.play("headbob")
		pass
	if Input.is_action_pressed("back") and not back_ray.is_colliding():
		tween= create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		tween.tween_property(self,"transform", transform.translated($Camera3D.get_global_transform().basis.z * 2),TRAVEL_TIME)
		animation.play("headbob")
		pass
	if Input.is_action_pressed("left"):
		tween= create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		tween.tween_property(self, "transform:basis", transform.basis.rotated($Camera3D.get_global_transform().basis.y, PI / 2), TRAVEL_TIME)
		print(rotation)
		pass
	if Input.is_action_pressed("right"):
		tween= create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		tween.tween_property(self, "transform:basis", transform.basis.rotated($Camera3D.get_global_transform().basis.y, -PI / 2), TRAVEL_TIME)
		pass
pass
