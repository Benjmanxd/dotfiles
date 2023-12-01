local status_ok, transparent = pcall(require, "transparent")
if not status_ok then
	return
end

local config = {
	groups = {
		"Normal",
		"NormalNC",
		"Comment",
		"Constant",
		"Special",
		"Identifier",
		"Statement",
		"PreProc",
		"Type",
		"Underlined",
		"Todo",
		"String",
		"Function",
		"Conditional",
		"Repeat",
		"Operator",
		"Structure",
		"LineNr",
		"NonText",
		"SignColumn",
		"CursorLine",
		"CursorLineNr",
		"StatusLine",
		"StatusLineNC",
		"EndOfBuffer",
		"Unlisted",
	},
}

transparent.clear_prefix("BufferLine")
transparent.clear_prefix("NeoTree")
transparent.clear_prefix("lualine")
transparent.clear_prefix("Aerial")
transparent.setup(config)
