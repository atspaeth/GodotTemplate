extends CheckButton

func _ready():
    set_pressed_no_signal(Global.fullscreen)

    # Concept of fullscreen doesn't exist on mobile.
    if !OS.has_feature("pc"):
        hide()

func _on_toggled(bpressed):
    Global.set_setting("fullscreen", bpressed)
