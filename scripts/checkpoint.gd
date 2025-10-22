extends Area2D

@onready var anim = $anim as AnimatedSprite2D

var is_active = false

func _on_body_entered(body: Node2D) -> void:
	if body.name != "player" or is_active:
		return
	activate_checkpoint() 

func activate_checkpoint():
	Globals.current_checkpoint = self
	anim.play("raising")
	is_active = true
	
func _on_anim_animation_finished() -> void:
	if anim.animation == "raising":
		anim.play("checked")
