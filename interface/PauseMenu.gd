extends Control

@onready var pause_options:Control = $PauseOptions

func _input(event:InputEvent) -> void:
    if event.is_action_released("pause"):
        call_deferred("_resume")

func _resume() -> void:
    hide()
    get_parent().get_tree().paused = false

func pause() -> void:
    show()
    @warning_ignore('unsafe_method_access')
    pause_options.focus()
