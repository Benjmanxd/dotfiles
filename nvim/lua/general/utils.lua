local utils = {}

utils.icons = require("general.icons.nerd_font")
utils.text_icons = require("general.icons.text")

--- Get an icon from `lspkind` if it is available and return it
-- @param kind the kind of icon in `lspkind` to retrieve
-- @return the icon
function utils.get_icon(kind)
  return utils.icons[kind] or utils.text_icons[kind] or ""
end

function utils.set_theme(palette_table)
  for k, v in pairs(palette_table) do
    vim.api.nvim_set_hl(0, k, v)
  end
end

function utils.func_wrapper(func, ...)
  local args = {...}
  return function()
    func(table.unpack(args))
  end
end

return utils
