extends Control

@onready var pause_options:Control = $PauseOptions

func _input(event:InputEvent):
    if event.is_action_released("pause"):
        call_deferred("_resume")

func _resume():
    hide()
    get_parent().get_tree().paused = false

func pause():
    show()
    @warning_ignore('unsafe_method_access')
    pause_options.focus()
