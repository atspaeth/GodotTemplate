# Godot Template

Template repository for getting started with a new Godot game quickly, originally based on [@brettchalupa](https://www.github.com/brettchalupa)'s Godot Skeleton. Handles main menu, pause menu, settings that persist and load from disk, and overall structure.

Godot versions supported: 4.0+


## Project Structure

- Scenes are stored next to their assets in three categories: entities,
  interface, and levels.
- SettingsManager and HUD autoloads make it possible to run any level as a standalone scene without duplicating UI and configuration.
- Settings config gets written to the userspace, [see the docs for details on the per-OS location](https://docs.godotengine.org/en/stable/tutorials/io/data_paths.html#accessing-persistent-user-data-user)
- Uses Git LFS for asset files.


## Build Exports

There is a Ruby script called `export` which calls `godot` to export to the configurations defined in the project settings.

If you configure `[itch]` in `export.cfg` with `user` (your handle) and `game` (your game slug) and have [butler](https://itch.io/docs/butler/) installed, your builds will automatically get pushed to itch.io.


## Template License

This is public domain like the original. Use it for your own projects with no need for credit or attribution or anything. [View the Unlicense for more details.](https://unlicense.org/)
