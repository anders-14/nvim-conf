local color = {}

local base16 = require('base16')

local theme_names = base16.theme_names()
table.sort(theme_names)
local base16_position = 1

local index = {}
for k,v in pairs(theme_names) do
  index[v]=k
end

-- Prints the current theme, name and index
function color.print_theme()
  print("Colorscheme:", theme_names[base16_position], base16_position)
end

-- Sets the theme given an index
-- Does not work, the themes are randomized
-- for some reason, didnt do that before
function color.set_theme_by_pos(pos)
  if tonumber(pos) ~= nil then base16_position = tonumber(pos) end
  base16(base16.themes[theme_names[base16_position]], true)
  vim.fn.RemoveBackground()
  color.print_theme()
end

-- Sets theme by name
function color.set_theme_by_name(name)
  idx = index[name]
  if idx == nil then 
    print('Invalid theme name:', name)
    color.custom()
  else color.set_theme_by_pos(idx)
  end
end

-- Rotates the theme given a direction, negative or positive
function color.rotate_theme(dir)
  if tonumber(dir) == nil then return end
  dir = tonumber(dir)
  base16_position = (base16_position + dir) % #theme_names
  if base16_position == 0 then
    base16_position = #theme_names
  end
  base16(base16.themes[theme_names[base16_position]], true)
  vim.fn.RemoveBackground()
  color.print_theme()
end


-- My custom theme
function color.custom()

  -- https://github.com/chriskempson/base16/blob/master/styling.md
  local custom_theme = base16.theme_from_array {
    "181818"; "282828"; "383838"; "585858";
    "b8b8b8"; "d8d8d8"; "e8e8e8"; "f8f8f8";
    "ab4642"; "dc9656"; "f7ca88"; "a1b56c";
    "86c1b9"; "7cafc2"; "ba8baf"; "a16946";
  }

  base16(custom_theme, true)
  vim.fn.RemoveBackground()
  print("Colorsheme: Anders")
end

return color
