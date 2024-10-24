return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			go = { "gofmt" },
			javascript = { "prettier" },
			lua = { "stylua" },
			python = { "black" },
			rust = { "rustfmt" },
			cmake = { "cmake_format" },
			cpp = { "clang-format" },
		},
	},
	config = function(_, opts)
		local conform = require("conform")
		vim.keymap.set("n", "<leader>f", conform.format, { desc = "[F]ormat", buffer = vim.bufnr, silent = true })
		conform.setup(opts)
	end,
}
