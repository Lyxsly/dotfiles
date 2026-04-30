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
config.window_background_opacity = 0.8
-- config.macos_window_background_blur = 20
config.text_background_opacity = 1.0
----------------------------------------------------
-- Window & Tab Design
----------------------------------------------------
-- タイトルバーを一体型ボタンにする（ボタン消滅対策）
config.window_decorations = "NONE"

config.show_tabs_in_tab_bar = true
-- デザインを確認するために、タブが1つでも表示するように false に変更
config.hide_tab_bar_if_only_one_tab = false

config.window_frame = {
	inactive_titlebar_bg = "none",
	active_titlebar_bg = "none",
}
config.window_background_gradient = {
	colors = { "#000000" },
}

config.show_new_tab_button_in_tab_bar = false
config.colors = {
	tab_bar = {
		inactive_tab_edge = "none",
	},
}

-- タブの形をカスタマイズ（斜めの装飾）
local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local background = "#5c6d74"
	local foreground = "#FFFFFF"
	local edge_background = "none"

	if tab.is_active then
		background = "#ae8b2d"
		foreground = "#FFFFFF"
	end

	local edge_foreground = background
	-- ここも pame -> pane に修正済み
	local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "

	return {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_LEFT_ARROW },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_RIGHT_ARROW },
	}
end)

----------------------------------------------------
-- Keybinds (一旦デフォルトを維持)
----------------------------------------------------
-- もし自分で keybinds.lua を作って管理したい場合は以下を有効化してください
-- config.disable_default_key_bindings = true
-- config.keys = require("keybinds").keys
-- config.key_tables = require("keybinds").key_tables
-- config.leader = { key = "q", mods = "CTRL", timeout_milliseconds = 2000 }

return config
