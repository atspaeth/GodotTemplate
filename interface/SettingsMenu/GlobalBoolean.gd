extends CheckButton
class_name SettingsBoolean

## The name of the underlying SettingsManager setting to control.
@export var setting_name: String

func _ready() -> void:
    if not SettingsManager.setting_exists(setting_name):
        hide()
        return

    var state: Variant = SettingsManager.get_setting(setting_name)
    if state is not bool:
        hide()
        return

    var initial_set: bool = state
    set_pressed_no_signal(initial_set)

func _on_toggled(to_state: bool) -> void:
    SettingsManager.set_setting(setting_name, to_state)
