return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		signs = false,
		gui_style = {
			fg = "NONE",
			bg = "BOLD",
		},
		highlight = {
			multiline = true,
			multiline_pattern = "^.",
		},
		colors = {
			error = { "DiagnosticError", "ErrorMsg", "#dc2626" },
			warning = { "DiagnosticWarn", "WarningMsg", "#fbbf24" },
			info = { "DiagnosticInfo", "#2563eb" },
			hint = { "DiagnosticHint", "#10b981" },
			default = { "Identifier", "#7c3aed" },
			test = { "Identifier", "#ff00ff" },
		},
	},
}
