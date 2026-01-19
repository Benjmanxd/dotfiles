return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {
		enabled = true,
		indent = {
			char = ":",
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
	},
}

-- theme.indentblankline = {
-- 	IblIndent = { fg = palette.purple_comment, bg = palette.none },
-- }
