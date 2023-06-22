-- Standard awesome library
local awful = require("awful")

local _M = {}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get ()
  tags = {}
  local tagpairs = {
  names = {"1", "2", "3", "4", "5"},
  layouts = {_G.layouts[2], _G.layouts[1], _G.layouts[9], _G.layouts[2], _G.layouts[1]
    }
  }
  awful.screen.connect_for_each_screen(function(s)
    -- Each screen has its own tag table.
    tags[s] = awful.tag(
      tagpairs.names, s, tagpairs.layouts
    )
  end)
  
  return tags
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable(
  {}, 
  { __call = function(_, ...) return _M.get(...) end }
)
