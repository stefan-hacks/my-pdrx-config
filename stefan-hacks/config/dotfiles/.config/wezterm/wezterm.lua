-- ============================================================================
-- WEZTERM TERMINAL CONFIGURATION
-- Equivalent to kitty.conf with same keybinds
-- ============================================================================

local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}

-- Use config builder for newer wezterm versions
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- ============================================================================
-- PERFORMANCE OPTIMIZATION
-- ============================================================================
-- Equivalent to kitty's repaint_delay and input_delay
config.max_fps = 120
config.animation_fps = 60
config.prefer_egl = true

-- Equivalent to sync_to_monitor
config.front_end = "WebGpu"  -- or "OpenGL" for better performance

-- ============================================================================
-- CURSOR SETTINGS
-- ============================================================================
-- Wezterm doesn't have exact cursor trail equivalent, but we can configure cursor
config.default_cursor_style = 'BlinkingBlock'
config.cursor_blink_rate = 800
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'

-- ============================================================================
-- WINDOW APPEARANCE
-- ============================================================================
-- Hide OS window decorations (title bar, etc.)
config.window_decorations = "NONE"  -- Equivalent to hide_window_decorations yes

-- Window padding (equivalent to window_padding_width)
config.window_padding = {
  left = 2,
  right = 2,
  top = 2,
  bottom = 2,
}

-- Inactive pane dimming (equivalent to inactive_text_alpha)
config.inactive_pane_hsb = {
  saturation = 0.9,
  brightness = 0.7,  -- 70% brightness for inactive panes
}

-- ============================================================================
-- WINDOW SIZING & BEHAVIOR
-- ============================================================================
-- Default window dimensions (equivalent to initial_window_width/height)
config.initial_cols = 100
config.initial_rows = 30

-- ============================================================================
-- TRANSPARENCY & BLUR
-- ============================================================================
-- Background opacity (equivalent to background_opacity 0.95)
config.window_background_opacity = 0.95

-- Enable blur (equivalent to background_blur)
config.macos_window_background_blur = 10  -- macOS only
-- For Linux with compositors that support blur:
config.window_background_gradient = {
  colors = { '#000000' },
  -- This is a workaround for blur on Linux
}

-- Text background opacity
config.text_background_opacity = 0.9

-- ============================================================================
-- FONTS
-- ============================================================================
-- Primary font family (equivalent to font_family Hack Nerd Font)
config.font = wezterm.font_with_fallback({
  { family = 'Hack Nerd Font', weight = 'Regular' },
  { family = 'JetBrains Mono', weight = 'Regular' },
  'Noto Color Emoji',
})

-- Base font size (equivalent to font_size 13.0)
config.font_size = 13.0

-- Enable ligatures (equivalent to disable_ligatures never)
config.harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' }

-- ============================================================================
-- URL HANDLING
-- ============================================================================
-- Enable hyperlink rules and detection
config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- Add custom URL prefixes (equivalent to url_prefixes)
table.insert(config.hyperlink_rules, {
  regex = '\\b\\w+://[\\w.-]+\\S*\\b',
  format = '$0',
})

-- ============================================================================
-- THEME & COLORS
-- ============================================================================
-- Catppuccin Mocha theme (equivalent to include current-theme.conf)
config.color_scheme = 'Catppuccin Mocha'

-- Alternative: define colors manually if theme not available
-- You can also create a separate colors file and include it

-- ============================================================================
-- TAB BAR CONFIGURATION
-- ============================================================================
config.enable_tab_bar = true
config.use_fancy_tab_bar = false  -- Use retro style tab bar
config.tab_bar_at_bottom = false  -- Equivalent to tab_bar_edge top
config.hide_tab_bar_if_only_one_tab = false

-- Tab styling
config.tab_max_width = 32

-- Custom tab bar formatting (equivalent to tab_title_template)
wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local title = tab.tab_index + 1 .. ': ' .. tab.active_pane.title
  
  if tab.is_active then
    return {
      { Text = '[' .. title .. ']' },
    }
  end
  
  return title
end)

-- Tab bar colors
config.colors = {
  tab_bar = {
    background = '#1e1e2e',
    active_tab = {
      bg_color = '#89b4fa',
      fg_color = '#1e1e2e',
      intensity = 'Bold',
      italic = true,
    },
    inactive_tab = {
      bg_color = '#313244',
      fg_color = '#cdd6f4',
    },
    inactive_tab_hover = {
      bg_color = '#45475a',
      fg_color = '#cdd6f4',
    },
    new_tab = {
      bg_color = '#1e1e2e',
      fg_color = '#cdd6f4',
    },
    new_tab_hover = {
      bg_color = '#45475a',
      fg_color = '#cdd6f4',
    },
  },
}

-- ============================================================================
-- KEYBINDINGS
-- ============================================================================
config.keys = {
  -- ========================================================================
  -- FONT SIZE ADJUSTMENT
  -- ========================================================================
  -- Equivalent to: map ctrl+equal change_font_size all +2.0
  { key = '=', mods = 'CTRL', action = act.IncreaseFontSize },
  -- Equivalent to: map ctrl+minus change_font_size all -2.0
  { key = '-', mods = 'CTRL', action = act.DecreaseFontSize },
  -- Equivalent to: map cmd+0 change_font_size all 0
  { key = '0', mods = 'CTRL', action = act.ResetFontSize },

  -- ========================================================================
  -- TAB NAVIGATION - Switch to specific tab by number
  -- ========================================================================
  -- Equivalent to: map alt+1 goto_tab 1
  { key = '1', mods = 'ALT', action = act.ActivateTab(0) },
  { key = '2', mods = 'ALT', action = act.ActivateTab(1) },
  { key = '3', mods = 'ALT', action = act.ActivateTab(2) },
  { key = '4', mods = 'ALT', action = act.ActivateTab(3) },
  { key = '5', mods = 'ALT', action = act.ActivateTab(4) },
  { key = '6', mods = 'ALT', action = act.ActivateTab(5) },
  { key = '7', mods = 'ALT', action = act.ActivateTab(6) },
  { key = '8', mods = 'ALT', action = act.ActivateTab(7) },
  { key = '9', mods = 'ALT', action = act.ActivateTab(8) },
  { key = '0', mods = 'ALT', action = act.ActivateTab(9) },

  -- ========================================================================
  -- TAB CYCLING
  -- ========================================================================
  -- Equivalent to: map ctrl+tab next_tab
  { key = 'Tab', mods = 'CTRL', action = act.ActivateTabRelative(1) },
  -- Equivalent to: map ctrl+shift+tab previous_tab
  { key = 'Tab', mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(-1) },

  -- ========================================================================
  -- TAB CREATION AND CLOSING
  -- ========================================================================
  -- Equivalent to: map ctrl+t new_tab
  { key = 't', mods = 'CTRL', action = act.SpawnTab 'CurrentPaneDomain' },
  -- Equivalent to: map ctrl+shift+w close_tab
  { key = 'w', mods = 'CTRL|SHIFT', action = act.CloseCurrentTab{ confirm = true } },

  -- ========================================================================
  -- TAB REORDERING
  -- ========================================================================
  -- Equivalent to: map ctrl+shift+page_up move_tab_backward
  { key = 'PageUp', mods = 'CTRL|SHIFT', action = act.MoveTabRelative(-1) },
  -- Equivalent to: map ctrl+shift+page_down move_tab_forward
  { key = 'PageDown', mods = 'CTRL|SHIFT', action = act.MoveTabRelative(1) },

  -- ========================================================================
  -- NEW TAB/WINDOW WITH CURRENT DIRECTORY
  -- ========================================================================
  -- Equivalent to: map ctrl+shift+n new_tab_with_cwd
  { key = 'n', mods = 'CTRL|SHIFT', action = act.SpawnTab 'CurrentPaneDomain' },
  -- Equivalent to: map ctrl+shift+enter new_window_with_cwd
  { key = 'Enter', mods = 'CTRL|SHIFT', action = act.SpawnWindow },

  -- ========================================================================
  -- PANE SPLITTING (WINDOW MANAGEMENT)
  -- ========================================================================
  -- Equivalent to: map alt+- launch --cwd=current --location=hsplit
  { key = '-', mods = 'ALT', action = act.SplitVertical{ domain = 'CurrentPaneDomain' } },
  -- Equivalent to: map alt+\ launch --cwd=current --location=vsplit
  { key = '\\', mods = 'ALT', action = act.SplitHorizontal{ domain = 'CurrentPaneDomain' } },

  -- ========================================================================
  -- PANE NAVIGATION (Vim-style)
  -- ========================================================================
  -- Equivalent to: map alt+h neighboring_window left
  { key = 'h', mods = 'ALT', action = act.ActivatePaneDirection 'Left' },
  -- Equivalent to: map alt+l neighboring_window right
  { key = 'l', mods = 'ALT', action = act.ActivatePaneDirection 'Right' },
  -- Equivalent to: map alt+k neighboring_window up
  { key = 'k', mods = 'ALT', action = act.ActivatePaneDirection 'Up' },
  -- Equivalent to: map alt+j neighboring_window down
  { key = 'j', mods = 'ALT', action = act.ActivatePaneDirection 'Down' },

  -- ========================================================================
  -- PANE RESIZING
  -- ========================================================================
  -- Equivalent to: map alt+shift+k resize_window taller
  { key = 'k', mods = 'ALT|SHIFT', action = act.AdjustPaneSize{ 'Up', 3 } },
  -- Equivalent to: map alt+shift+j resize_window shorter
  { key = 'j', mods = 'ALT|SHIFT', action = act.AdjustPaneSize{ 'Down', 3 } },
  -- Equivalent to: map alt+shift+h resize_window wider
  { key = 'h', mods = 'ALT|SHIFT', action = act.AdjustPaneSize{ 'Left', 3 } },
  -- Equivalent to: map alt+shift+l resize_window narrower
  { key = 'l', mods = 'ALT|SHIFT', action = act.AdjustPaneSize{ 'Right', 3 } },

  -- ========================================================================
  -- PANE CLOSING AND MANAGEMENT
  -- ========================================================================
  -- Equivalent to: map ctrl+shift+q close_window
  { key = 'q', mods = 'CTRL|SHIFT', action = act.CloseCurrentPane{ confirm = true } },
  -- Equivalent to: map ctrl+shift+x detach_window (close pane without confirmation)
  { key = 'x', mods = 'CTRL|SHIFT', action = act.CloseCurrentPane{ confirm = false } },

  -- ========================================================================
  -- ALTERNATIVE PANE NAVIGATION (Arrow keys)
  -- ========================================================================
  -- Equivalent to: map ctrl+shift+down neighboring_window down
  { key = 'DownArrow', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Down' },
  { key = 'UpArrow', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Up' },
  { key = 'LeftArrow', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Left' },
  { key = 'RightArrow', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Right' },

  -- ========================================================================
  -- FULLSCREEN AND LAYOUT MANAGEMENT
  -- ========================================================================
  -- Equivalent to: map f11 toggle_fullscreen
  { key = 'F11', mods = 'NONE', action = act.ToggleFullScreen },
  
  -- Wezterm doesn't have kitty's layout system, but we can use pane zoom
  -- Equivalent to: map ctrl+shift+space toggle_layout stack
  { key = 'Space', mods = 'CTRL|SHIFT', action = act.TogglePaneZoomState },

  -- ========================================================================
  -- PANE ROTATION AND MOVEMENT
  -- ========================================================================
  -- Equivalent to layout rotation
  { key = 'Space', mods = 'CTRL|ALT', action = act.RotatePanes 'Clockwise' },
  { key = 'Space', mods = 'CTRL|ALT|SHIFT', action = act.RotatePanes 'CounterClockwise' },

  -- ========================================================================
  -- COARSE PANE RESIZING
  -- ========================================================================
  -- Equivalent to ctrl+shift+alt+[arrows] for larger increments
  { key = 'DownArrow', mods = 'CTRL|SHIFT|ALT', action = act.AdjustPaneSize{ 'Down', 10 } },
  { key = 'UpArrow', mods = 'CTRL|SHIFT|ALT', action = act.AdjustPaneSize{ 'Up', 10 } },
  { key = 'LeftArrow', mods = 'CTRL|SHIFT|ALT', action = act.AdjustPaneSize{ 'Left', 10 } },
  { key = 'RightArrow', mods = 'CTRL|SHIFT|ALT', action = act.AdjustPaneSize{ 'Right', 10 } },

  -- ========================================================================
  -- PANE SELECTION BY NUMBER
  -- ========================================================================
  -- Equivalent to: map ctrl+1 first_window
  { key = '1', mods = 'CTRL', action = act.ActivatePaneByIndex(0) },
  { key = '2', mods = 'CTRL', action = act.ActivatePaneByIndex(1) },
  { key = '3', mods = 'CTRL', action = act.ActivatePaneByIndex(2) },
  { key = '4', mods = 'CTRL', action = act.ActivatePaneByIndex(3) },
  { key = '5', mods = 'CTRL', action = act.ActivatePaneByIndex(4) },
  { key = '6', mods = 'CTRL', action = act.ActivatePaneByIndex(5) },
  { key = '7', mods = 'CTRL', action = act.ActivatePaneByIndex(6) },
  { key = '8', mods = 'CTRL', action = act.ActivatePaneByIndex(7) },
  { key = '9', mods = 'CTRL', action = act.ActivatePaneByIndex(8) },

  -- ========================================================================
  -- PANE SWAPPING
  -- ========================================================================
  -- Equivalent to: map ctrl+shift+alt+space swap_with_window
  { key = 'Space', mods = 'CTRL|SHIFT|ALT', action = act.PaneSelect{ mode = 'SwapWithActive' } },

  -- ========================================================================
  -- CLIPBOARD OPERATIONS
  -- ========================================================================
  -- Equivalent to: map ctrl+shift+c copy_to_clipboard
  { key = 'c', mods = 'CTRL|SHIFT', action = act.CopyTo 'Clipboard' },
  -- Equivalent to: map ctrl+shift+v paste_from_clipboard
  { key = 'v', mods = 'CTRL|SHIFT', action = act.PasteFrom 'Clipboard' },
  -- Equivalent to: map shift+insert paste_from_clipboard
  { key = 'Insert', mods = 'SHIFT', action = act.PasteFrom 'Clipboard' },

  -- ========================================================================
  -- SCROLLING
  -- ========================================================================
  -- Equivalent to: map ctrl+shift+page_up scroll_line_up
  { key = 'PageUp', mods = 'SHIFT', action = act.ScrollByPage(-0.5) },
  -- Equivalent to: map ctrl+shift+page_down scroll_line_down
  { key = 'PageDown', mods = 'SHIFT', action = act.ScrollByPage(0.5) },
  
  -- Scroll to top/bottom
  -- Equivalent to: map ctrl+shift+home scroll_home
  { key = 'Home', mods = 'CTRL|SHIFT', action = act.ScrollToTop },
  -- Equivalent to: map ctrl+shift+end scroll_end
  { key = 'End', mods = 'CTRL|SHIFT', action = act.ScrollToBottom },

  -- Scroll to prompt
  { key = 'Home', mods = 'CTRL|ALT', action = act.ScrollToPrompt(-1) },
  { key = 'End', mods = 'CTRL|ALT', action = act.ScrollToPrompt(1) },

  -- ========================================================================
  -- URL OPENING
  -- ========================================================================
  -- Equivalent to: map ctrl+shift+u open_url_with_hints
  { key = 'u', mods = 'CTRL|SHIFT', action = act.QuickSelect },

  -- Equivalent to: map ctrl+shift+o open_selected_path
  { key = 'o', mods = 'CTRL|SHIFT', action = act.QuickSelectArgs{
    patterns = { 'https?://\\S+', 'file://\\S+' },
  }},

  -- ========================================================================
  -- CONFIGURATION MANAGEMENT
  -- ========================================================================
  -- Equivalent to: map ctrl+alt+r load_config_file
  { key = 'r', mods = 'CTRL|ALT', action = act.ReloadConfiguration },
  
  -- Equivalent to: map ctrl+shift+alt+comma edit_config_file
  { key = ',', mods = 'CTRL|SHIFT|ALT', action = act.SpawnCommandInNewTab{
    args = { os.getenv('EDITOR') or 'vim', wezterm.config_file },
  }},

  -- ========================================================================
  -- MISCELLANEOUS
  -- ========================================================================
  -- Equivalent to: map ctrl+shift+delete clear_terminal reset active
  { key = 'Delete', mods = 'CTRL|SHIFT', action = act.Multiple{
    act.ClearScrollback 'ScrollbackAndViewport',
    act.SendKey{ key = 'L', mods = 'CTRL' },
  }},

  -- Debug overlay (similar to kitty_shell)
  -- Equivalent to: map ctrl+shift+escape kitty_shell window
  { key = 'Escape', mods = 'CTRL|SHIFT', action = act.ShowDebugOverlay },

  -- Unicode character selector
  -- Equivalent to: map ctrl+shift+u kitten unicode_input
  { key = 'u', mods = 'CTRL|SHIFT|ALT', action = act.CharSelect{
    copy_on_select = true,
    copy_to = 'ClipboardAndPrimarySelection',
  }},

  -- Search mode (similar to scrollback search)
  -- Equivalent to: map ctrl+shift+h kitty_scrollback_nvim
  { key = 'h', mods = 'CTRL|SHIFT', action = act.Search 'CurrentSelectionOrEmptyString' },

  -- Copy mode (vi-like scrollback)
  { key = 'g', mods = 'CTRL|SHIFT', action = act.ActivateCopyMode },

  -- Command palette
  { key = 'p', mods = 'CTRL|SHIFT', action = act.ActivateCommandPalette },

  -- Show launcher (tabs, panes, etc.)
  { key = 'l', mods = 'CTRL|SHIFT|ALT', action = act.ShowLauncher },
}

-- ============================================================================
-- MOUSE BINDINGS
-- ============================================================================
config.mouse_bindings = {
  -- Click to select and open URLs
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'NONE',
    action = act.CompleteSelection 'ClipboardAndPrimarySelection',
  },
  
  -- Double-click selects word
  {
    event = { Up = { streak = 2, button = 'Left' } },
    mods = 'NONE',
    action = act.CompleteSelection 'ClipboardAndPrimarySelection',
  },
  
  -- Triple-click selects line
  {
    event = { Up = { streak = 3, button = 'Left' } },
    mods = 'NONE',
    action = act.CompleteSelection 'ClipboardAndPrimarySelection',
  },

  -- Middle-click paste
  {
    event = { Up = { streak = 1, button = 'Middle' } },
    mods = 'NONE',
    action = act.PasteFrom 'PrimarySelection',
  },

  -- Right-click paste
  {
    event = { Up = { streak = 1, button = 'Right' } },
    mods = 'NONE',
    action = act.PasteFrom 'Clipboard',
  },

  -- CTRL+Click to open hyperlinks
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'CTRL',
    action = act.OpenLinkAtMouseCursor,
  },
}

-- ============================================================================
-- ADDITIONAL SETTINGS
-- ============================================================================
-- Enable scrollback
config.scrollback_lines = 10000

-- Automatically reload config when it changes
config.automatically_reload_config = true

-- Use dead keys for international keyboards
config.use_dead_keys = true

-- Enable CSI u mode for better key handling
config.enable_csi_u_key_encoding = true

-- Enable kitty graphics protocol
config.enable_kitty_graphics = true

-- Unix domain socket for remote control (similar to kitty's listen_on)
config.unix_domains = {
  {
    name = 'unix',
  },
}

-- Default domain
-- config.default_gui_startup_args = { 'connect', 'unix' }

-- Exit behavior
config.exit_behavior = 'Close'

-- Window close confirmation
config.window_close_confirmation = 'NeverPrompt'

-- Audible bell
config.audible_bell = 'Disabled'

-- Visual bell
config.visual_bell = {
  fade_in_function = 'EaseIn',
  fade_in_duration_ms = 150,
  fade_out_function = 'EaseOut',
  fade_out_duration_ms = 150,
}

-- ============================================================================
-- PLATFORM-SPECIFIC SETTINGS
-- ============================================================================
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  -- Windows-specific settings
  config.default_prog = { 'pwsh.exe' }
elseif wezterm.target_triple:find('linux') then
  -- Linux-specific settings
  config.enable_wayland = true
  
  -- For X11, you might want to enable this for better clipboard support
  -- config.enable_wayland = false
end

return config
