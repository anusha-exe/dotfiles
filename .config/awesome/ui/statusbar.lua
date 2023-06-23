-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
-- only needed for dpi in menubar
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
-- Wibox handling library
local wibox = require("wibox")
-- Custom Local Library: Common Functional Decoration
local ui = {
    wallpaper = require("ui.wallpaper"),
    taglist = require("ui.taglist"),
    tasklist = require("ui.tasklist")
}
local taglist_buttons  = ui.taglist()
local tasklist_buttons = ui.tasklist()
local _M = {}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Wibar
mytextclock = wibox.widget.textclock()

awful.screen.connect_for_each_screen(function(s)
  -- Wallpaper
    set_wallpaper(s)
    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Copied from somewhere. Don't know how it might be useful yet
    -- local layoutbox = wibox.widget({
    --         s.mylayoutbox,
    --         top = 3,
    --         bottom = 4,
    --         left = 5,
    --         right = 10,
    --         widget = wibox.container.margin,
    --     })
    
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
           screen  = s,
           filter  = awful.widget.taglist.filter.all,
           buttons = taglist_buttons
       }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
    }

    -- Create the wibox
    local bar_offset = 6
    s.mywibox = awful.wibar({ position = "top", screen = s, width = s.geometry.width - (2 * bar_offset), border_width = dpi(0),
        border_color = "#00000000", shape = function (cr, w, h)
  gears.shape.rounded_rect(cr, w, h, 2)
end})
s.mywibox.x = bar_offset
s.mywibox.y = bar_offset
    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            -- _G.launcher,
            s.mytaglist,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            mykeyboardlayout,
            wibox.widget.systray(),
            mytextclock,
            s.mylayoutbox,
        },
    }
end)
    
