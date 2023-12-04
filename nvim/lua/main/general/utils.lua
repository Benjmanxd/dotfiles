local utils = {}

utils.icons = require("main.icons.nerd_font")
utils.text_icons = require("main.icons.text")

--- Get an icon from `lspkind` if it is available and return it
-- @param kind the kind of icon in `lspkind` to retrieve
-- @return the icon
function utils.get_icon(kind)
	return utils.icons[kind] or utils.text_icons[kind] or ""
end

function utils.set_theme(palette)
	for k, v in pairs(palette) do
		vim.cmd(
			string.format(
				"highlight %s gui=%s guifg=%s guibg=%s",
				k,
				v.style and table.concat(v.style, ",") or "none",
				v.fg,
				v.bg
			)
		)
	end
end

return utils
