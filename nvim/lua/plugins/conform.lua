return {
	"stevearc/conform.nvim",
  keys = {
    { "<leader>f", "<CMD>lua require('conform').format()<CR>", desc = "[F]ormat", buffer = vim.bufnr, silent = true },
  },
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
}
