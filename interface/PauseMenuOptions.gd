extends VFlowContainer

@onready var quit_button:Button = $Quit

func _ready() -> void:
    focus()

    # Don't show a quit button on mobile.
    if !OS.has_feature("pc"):
        quit_button.hide()

func focus() -> void:
    for child in get_children():
        (child as Control).grab_focus()
        break

func _on_quit_pressed() -> void:
    get_tree().quit()

func _on_main_menu_pressed() -> void:
    var root = get_tree().get_root().get_tree()
    root.paused = false
    root.change_scene_to_file('res://interface/MainMenu.tscn')
