extends CanvasLayer

@onready var bg_overlay: ColorRect = $bg_overlay

func _ready() -> void:
	show_new_scene()


func change_scene(path, delay= 2.0):
	var scene_transition = get_tree().create_tween()
	scene_transition.tween_property(bg_overlay, "threshold", 1.0, 0.5)
	await scene_transition.finished
	assert(get_tree().change_scene_to_file(path) == OK)
	
func show_new_scene():
	var show_transition = get_tree().create_tween()
	show_transition.tween_property(bg_overlay, "threshold", 0.0, 0.5).from(1.0)
	
