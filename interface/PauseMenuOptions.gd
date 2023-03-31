extends VFlowContainer

func _ready():
    focus()

    # Don't show a quit button on mobile.
    if !OS.has_feature("pc"):
        $Quit.hide()

func focus():
    get_children()[0].grab_focus()

func _on_quit_pressed():
    get_tree().quit()

func _on_main_menu_pressed():
    var root = get_tree().get_root().get_tree()
    root.paused = false
    root.change_scene_to_file('res://interface/MainMenu.tscn')
