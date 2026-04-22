-- WeztermのAPIを読み込む
local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

-- 🎨 1. カラースキーム（テーマ）の設定
-- Weztermには最初から数百種類のテーマが入っています。人気の暗いテーマを指定。
config.color_scheme = 'Tokyo Night'

-- 🔤 2. フォントの設定（先ほど入れた魔法のフォント）
config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.font_size = 12.0

-- 👻 3. 背景の透過（0.0が完全透明、1.0が不透明）
config.window_background_opacity = 0.85
config.text_background_opacity = 1.0 -- 文字の背景は透かさない（読みやすさ重視）

-- 🖼️ 4. 見た目の微調整
config.hide_tab_bar_if_only_one_tab = true -- タブが1つの時はバーを隠してスッキリさせる
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 10,
}
--config.enable_wayland=false

return config
