-- Standard awesome library
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup").widget
-- Theme handling library
local beautiful = require("beautiful") -- for awesome.icon

local M = {}  -- menu
local _M = {} -- module

-- reading
-- https://awesomewm.org/apidoc/popups%20and%20bars/awful.menu.html

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- This is used later as the default terminal and editor to run.
local terminal = _G.user_vars.terminal

-- Variable definitions
-- This is used later as the default terminal and editor to run.
local editor = _G.user_vars.editor
local editor_cmd = terminal .. " -e " .. editor

M.awesome = {
    { " Hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { " Manual", terminal .. " -e man awesome" },
   { " Edit Config", editor_cmd .. " " .. awesome.conffile },
   { " Restart", awesome.restart },
   { " Quit", function() awesome.quit() end }
}

-- More menu tables can be created if we want to append them to main menu
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()

  -- Main Menu
  local menu_items = {
    { " Terminal", terminal },
    { " Browser", browser},
    { " Editor", editor_cmd .. " "},
    { " AwesomeWM ", M.awesome, beautiful.awesome_subicon }
  }

  return menu_items
end
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable(
  {}, 
  { __call = function(_, ...) return _M.get(...) end }
)
