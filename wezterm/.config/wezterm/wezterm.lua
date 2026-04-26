-- WeztermのAPIを読み込む
local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action
config.automatically_reload_config = true

-- 🎨 1. カラースキーム（テーマ）の設定
-- config.color_scheme = "Tokyo Night"

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 12.0
config.use_ime = true

-- 👻 3. 背景の透過（0.0が完全透明、1.0が不透明）
config.window_background_opacity = 0.85
config.macos_window_background_blur = 20
config.text_background_opacity = 1.0
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true

config.window_frame = {
	inactive_titlebar_bg = "none",
	active_titlebar_bg = "none",
}

config.window_background_gradient = {
	colors = { "#000000" },
}

config.show_new_tab_button_in_tab_bar = false
config.show_close_tab_button_in_tabs = false

config.colors = {
	tab_bar = {
		inactive_tab_edge = "none",
	},
}

wezterm.on("format-tab-titel", function(tab, tabs, panes, config, hover, max_width)
	local background = "#5c6d74"
	local foreground = "#FFFFFF"

	if tab.is_active then
		background = "#ae8b2d"
		foreground = "#FFFFFF"
	end

	local title = "   " .. wezterm.truncate_right(tab.active_pame, max_width - 1) .. "   "

	return {
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
	}
end)
-- 🖼️ 4. 見た目の微調整
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}
--config.enable_wayland=false

return config
