return {
	{
		"neovim/nvim-lspconfig",
		keys = function()
			local buf = vim.lsp.buf
			local diag = vim.diagnostic
			return {
				{ "<leader>rn", buf.rename, desc = "[R]e[n]ame entity" },
				{ "<leader>ca", buf.code_action, desc = "[C]ode [A]ction" },
				-- { "gD", buf.declaration, desc = "[G]oto [D]eclaration" },
				-- { "gd", buf.definition, desc = "[G]oto [D]efinition" },
				-- { "gi", buf.implementation, desc = "[G]oto [I]mplementation" },
				{ "gt", buf.type_definition, desc = "[G]oto [T]ype Definition" },
				{
					"gh",
					function() vim.lsp.buf.hover({ border = "rounded", max_height = 25, max_width = 120 }) end,
					desc = "[G]oto [H]over",
				},
				{ "gr", buf.references, desc = "[G]oto [R]eferences" },
				{ "gl", diag.open_float, desc = "Open flating diagnostic message" },
				{ "[d", diag.goto_prev, desc = "Go to previous diagnostic message" },
				{ "]d", diag.goto_next, desc = "Go to next diagnostic message" },
				{ "gd", diag.setloclist, desc = "Open diagnostic list" },
			}
		end,
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
		end,
	},

	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				check_outdated_packages_on_open = true,
				border = "rounded",
			},
		},
	},

	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function(_, _)
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						workspace = {
							checkThirdParty = false,
						},
						diagnostics = {
							globals = { "vim", "require" },
						},
					},
				},
			})
			lspconfig.bashls.setup({})
			lspconfig.clangd.setup({})
			lspconfig.cmake.setup({})
			lspconfig.pyright.setup({})
			lspconfig.rust_analyzer.setup({})

			require("lspconfig.ui.windows").default_options.border = "rounded"
		end,
	},
}
