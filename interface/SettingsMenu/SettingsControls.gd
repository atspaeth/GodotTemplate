extends VFlowContainer

func _ready() -> void:
    for child in get_children():
        var control := child as Control
        if control.visible:
            control.grab_focus()
            break
