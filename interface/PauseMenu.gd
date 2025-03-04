extends Control

@onready var pause_options: Control = $PauseOptions
@onready var quit_button: Button = $PauseOptions/Quit
@onready var resume_button: Button = $PauseOptions/Resume


func _ready() -> void:
    # Don't show a quit button on mobile.
    if !OS.has_feature("pc"):
        quit_button.hide()


func _input(event: InputEvent) -> void:
    if event.is_action_released("pause"):
        call_deferred("_resume")


func resume() -> void:
    hide()
    get_tree().paused = false


func pause() -> void:
    show()
    resume_button.grab_focus()


func _on_resume_pressed() -> void:
    resume()


func _on_quit_pressed() -> void:
    get_tree().quit()


func _on_main_menu_pressed() -> void:
    resume()
    get_tree().change_scene_to_file('res://interface/MainMenu.tscn')
