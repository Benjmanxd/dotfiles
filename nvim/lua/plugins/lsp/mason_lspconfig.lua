return {
	"williamboman/mason-lspconfig.nvim",
	config = function(_, _)
		local mason_lspconfig = require("mason-lspconfig")
		local lspconfig = require("lspconfig")
		local servers = {
			lua_ls = {
				Lua = {
					workspace = {
						checkThirdParty = false,
					},
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
			bashls = {},
			clangd = {},
			cmake = {},
			-- gopls = {},
			pyright = {},
			rust_analyzer = {},
			ts_ls = {},
			vimls = {},
			zls = {},
		}

		require("lspconfig.ui.windows").default_options.border = "rounded"
		mason_lspconfig.setup({
			ensure_installed = vim.tbl_keys(servers),
			automatic_installation = false,
		})
		mason_lspconfig.setup_handlers({
			function(server_name)
				local opts = {
					on_attach = require("plugins.lsp.lsp_handlers").on_attach,
					capabilities = require("plugins.lsp.lsp_handlers").capabilities,
					settings = servers[server_name],
				}
				lspconfig[server_name].setup(opts)
			end,
		})
	end,
}
