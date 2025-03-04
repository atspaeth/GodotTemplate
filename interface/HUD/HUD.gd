extends CanvasLayer
class_name HUDClass


var enabled: bool:
    get:
        return enabled
    set(to):
        enabled = to
        visible = enabled
        set_process_input(enabled)


func disable() -> void:
    enabled = false


func enable() -> void:
    enabled = true


func _input(event: InputEvent) -> void:
    if event.is_action_released("ui_accept"):
        get_tree().change_scene_to_file("res://interface/MainMenu.tscn")
    elif event.is_action_released("pause"):
        call_deferred("_pause")


func _pause() -> void:
    @warning_ignore('unsafe_method_access')
    $PauseMenu.pause()
    get_tree().paused = true
