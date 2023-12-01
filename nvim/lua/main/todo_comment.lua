local status_ok, todo_comments = pcall(require, "todo-comments")
if not status_ok then
	return
end

local config = {
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
}

todo_comments.setup(config)
