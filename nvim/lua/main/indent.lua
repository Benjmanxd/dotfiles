local status_ok, indent = pcall(require, "ibl")
if not status_ok then
	return
end

local config = {
	enabled = true,
	indent = {
		char = ":",
		highlight = "Comment",
	},
	scope = {
		enabled = false,
	},
	exclude = {
		filetypes = {
			"help",
			"man",
			"checkhealth",
			"lspinfo",
			"neo-tree",
			"aerial",
			"gitcommit",
			"TelescopePrompt",
			"TelescopeResults",
		},
		buftypes = {
			"terminal",
			"nofile",
			"quickfix",
			"prompt",
		},
	},
}

indent.setup(config)
