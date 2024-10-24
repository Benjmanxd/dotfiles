return {
	"neovim/nvim-lspconfig",
	keys = {
		{ "[d", vim.diagnostic.goto_prev, desc = "Go to previous diagnostic message" },
		{ "]d", vim.diagnostic.goto_next, desc = "Go to next diagnostic message" },
		{ "gl", vim.diagnostic.open_float, desc = "Open flating diagnostic message" },
		{ "<leader>q", vim.diagnostic.setloclist, desc = "Open diagnostic list" },
	},
	init = function()
		local nerd_font = require("general.icons.nerd_font")
		local signs = {
			{ name = "DiagnosticSignError", text = nerd_font["DiagnosticError"] },
			{ name = "DiagnosticSignWarn", text = nerd_font["DiagnosticWarn"] },
			{ name = "DiagnosticSignHint", text = nerd_font["DiagnosticHint"] },
			{ name = "DiagnosticSignInfo", text = nerd_font["DiagnosticInfo"] },
		}
		for _, sign in ipairs(signs) do
			vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
		end

		vim.diagnostic.config({
			virtual_text = false,
			signs = {
				active = signs,
			},
			update_in_insert = true,
			underline = false,
			severity_sort = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})

		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = "rounded",
		})
		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
			border = "rounded",
		})
	end,
}
