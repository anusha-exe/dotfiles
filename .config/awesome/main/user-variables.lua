local home = os.getenv("HOME")
local _V = {
  -- This is used later as the default terminal and editor to run.
  terminal = "alacritty",
  editor = os.getenv("EDITOR") or "vim",
  -- editor_cmd = termimal .. " -e " .. editor,
  -- Don't know why editor_cmd won't work
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others. 
-- Default modkey.
  modkey = "Mod4",
   -- explorer = "thunar"
   browser = "firefox",
   launcher = "rofi -show drun",
  -- Also for theme?
  -- user defined wallpaper
  --wallpaper = home .. "/Pictures/your-wallpaper-here.jpg",
}

return _V
