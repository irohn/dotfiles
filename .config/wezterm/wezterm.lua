local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Color scheme
config.color_scheme = "kanagawabones"

-- Window customizations
config.window_decorations = "RESIZE"
config.window_padding = { left = 2, right = 2, top = 0, bottom = 0 }
config.hide_tab_bar_if_only_one_tab = true

-- Font settings
config.font = wezterm.font_with_fallback({
	"CaskaydiaCove Nerd Font",
	"Nerd Font Symbols",
	"Noto Color Emoji",
	"JetBrains Mono",
})
config.font_size = 16

return config
