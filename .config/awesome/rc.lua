-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

local dpi = beautiful.xresources.apply_dpi

-- Error handling
require("main.error-handling")

-- Adding module for user variables definitions
_G = {} -- Global namespace put on top to use the module
_G.user_vars = require('main.user-variables')

-- Themes define colours, icons, font and wallpapers.
beautiful.init("/home/anusha/.config/awesome/default/theme.lua")

terminal = _G.user_vars.terminal
editor = _G.user_vars.editor
editor_cmd = terminal .. " -e " .. editor
modkey = _G.user_vars.modkey
browser = _G.user_vars.browser
app_launcher = _G.user_vars.launcher

local main = {
  layouts = require("main.layouts"),
  tags = require("main.tags"),
  menu = require("main.menu"),
  rules = require("main.rules"),
  signals = require("main.signals"),
}

-- Layouts
_G.layouts = main.layouts()

-- Tags
_G.tags = main.tags()

-- Menu
_G.mainmenu = awful.menu({ items = main.menu() })
--  
_G.launcher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = _G.mainmenu })
-- Menubar configuration
menubar.utils.terminal = _G.user_vars.terminal -- Set the terminal for applications that require it

-- Custom Local Library: Common Functional Decoration
local ui = {
  -- titlebar = require("ui.titlebar") not needed because signals.lua is taking care of it. Or something ;_;
  -- wallpaper = require("ui.wallpaper"),
  -- taglist   = require("ui.taglist"),
  -- tasklist  = require("ui.tasklist")
}

require("ui.statusbar")

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- Mouse and Key bindings
local binding = {
    globalbuttons = require("bindings.globalbuttons"),
    clientbuttons = require("bindings.clientbuttons"),
    globalkeys = require("bindings.globalkeys"),
    clientkeys = require("bindings.clientkeys"),
    bindtotags = require("bindings.bindtotags")
}

_G.globalkeys = binding.globalkeys()
_G.globalkeys = binding.bindtotags(_G.globalkeys)

-- Set root (only effective when cursor is outside any client
root.buttons(binding.globalbuttons())
root.keys(_G.globalkeys)

-- Rules
-- Rules to apply to new clients (through the "manage" signal). Adds client key and mouse bindings
awful.rules.rules = main.rules(binding.clientkeys(), binding.clientbuttons())

-- Adding Gaps
beautiful.useless_gap=10
-- AutoStart Apps
awful.spawn.with_shell("nitrogen --restore")
awful.spawn.with_shell("picom")
