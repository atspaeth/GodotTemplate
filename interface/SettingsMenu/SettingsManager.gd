extends Node

var settings := {
    fullscreen = false,
    play_sfx = true,
    play_music = true
    }

const SETTINGS_FILE = "user://settings.cfg"
const CONFIG_SECTION = "settings"


func _ready() -> void:
    var config = ConfigFile.new()
    var err = config.load(SETTINGS_FILE)
    if err:
        push_warning("Failed to load %s (error %d)." % [SETTINGS_FILE, err])
    else:
        for setting in config.get_section_keys(CONFIG_SECTION):
            set_setting(setting, config.get_value(CONFIG_SECTION, setting), false)

    print_debug("SettingsManager ready")


## Persist all settings from the SettingsManager internal state to disk.
func save_settings() -> void:
    var config = ConfigFile.new()
    for setting:String in settings:
        config.set_value(CONFIG_SECTION, setting, settings[setting])
    config.save(SETTINGS_FILE)


## Assign a global setting value in the SettingsManager internal state.
## Defaults to saving all settings after one gets set, but can be disabled
## with the `save` argument.
func set_setting(setting:String, val:Variant, save:bool=true) -> void:
    settings[setting] = val

    if setting == "fullscreen":
        if val:
            DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
        else:
            DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

    if save:
        save_settings()


## Return whether a given setting exists and is valid on this platform.
func setting_exists(setting:String) -> bool:
    if setting == 'fullscreen':
        return OS.has_feature('pc')
    else:
        return setting in settings


## Return the current value of a setting.
func get_setting(setting:String) -> Variant:
    return settings.get(setting)
