return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lsp-document-symbol",
		"uga-rosa/cmp-dictionary",
		"hrsh7th/cmp-emoji",
		"petertriho/cmp-git",
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
	},
	opts = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local check_backspace = function()
			local col = vim.fn.col(".") - 1
			return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
		end
		return {
			view = {
				entries = { name = "custom", selection_order = "near_cursor" },
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			mapping = {
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
				["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
				["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
				["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
				["<C-e>"] = cmp.mapping({
					i = cmp.mapping.abort(),
					c = cmp.mapping.close(),
				}),
				["<C-g>"] = function()
					if cmp.visible_docs() then
						cmp.close_docs()
					else
						cmp.open_docs()
					end
				end,
				-- Accept currently selected item. If none selected, `select` first item.
				-- Set `select` to `false` to only confirm explicitly selected items.
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expandable() then
						luasnip.expand()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif check_backspace() then
						fallback()
					else
						fallback()
					end
				end, {
					"i",
					"s",
				}),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, {
					"i",
					"s",
				}),
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp", max_item_count = 10 },
				{ name = "luasnip", max_item_count = 5, option = { use_show_condition = false } },
				{ name = "nvim_lua", max_item_count = 5 },
				{ name = "path", max_item_count = 5, option = { trailing_slash = true, label_trailing_slash = true } },
				{ name = "emoji", max_item_count = 5 },
				{ name = "nvim_lsp_document_symbol" },
			}, {
				{ name = "buffer", max_item_count = 5, keyword_length = 3 },
			}),
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					local lspkind_ok, lspkind = pcall(require, "lspkind")
					local kind_icons = require("general.icons.cmp_icon")
					if not lspkind_ok then
						-- Kind icons
						-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
						vim_item.kind = kind_icons[vim_item.kind]
						vim_item.menu = ({
							buffer = "[Buf]",
							cmdline = "[Cmd]",
							emoji = "[Emo]",
							git = "[Git]",
							luasnip = "[Snip]",
							nvim_lsp = "[LSP]",
							nvim_lsp_document_symbol = "[Symb]",
							nvim_lua = "[Vim]",
							path = "[Path]",
						})[entry.source.name]
						vim_item.abbr = vim_item.abbr:match("[^(]+")
						return vim_item
					else
						return lspkind.cmp_format()(entry, vim_item)
					end
				end,
			},
			confirm_opts = {
				behavior = cmp.ConfirmBehavior.Replace,
				select = false,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
				-- documentation = false,
			},
			experimental = {
				ghost_text = false,
				native_menu = false,
			},
		}
	end,
	config = function(_, opts)
		local cmp = require("cmp")
		cmp.setup(opts)
		cmp.setup.filetype("gitcommit", {
			sources = cmp.config.sources({
				{ name = "git" },
			}, {
				{ name = "buffer" },
			}),
		})

		cmp.setup.cmdline({ "/", "?" }, { -- start with @
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "nvim_lsp_document_symbol", max_item_count = 10 },
			}, {
				{ name = "buffer", max_item_count = 10 },
			}),
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{
					name = "path",
					max_item_count = 10,
					option = { trailing_slash = false, label_trailing_slash = true },
				},
			}, {
				{ name = "cmdline", max_item_count = 10, option = { treat_trailing_slash = false } },
			}),
			matching = { disallow_symbol_nonprefix_matching = false },
		})

		require("luasnip.loaders.from_vscode").lazy_load()
	end,
}

-- vim command - :highlight Pmenu ctermbg=gray guibg=gray
-- {
--     PmenuSel = { bg = "#282C34", fg = "NONE" },
--     Pmenu = { fg = "#C5CDD9", bg = "#22252A" },
--
--     CmpItemAbbrDeprecated = { fg = "#7E8294", bg = "NONE", fmt = "strikethrough" },
--     CmpItemAbbrMatch = { fg = "#82AAFF", bg = "NONE", fmt = "bold" },
--     CmpItemAbbrMatchFuzzy = { fg = "#82AAFF", bg = "NONE", fmt = "bold" },
--     CmpItemMenu = { fg = "#C792EA", bg = "NONE", fmt = "italic" },
--
--     CmpItemKindField = { fg = "#EED8DA", bg = "#B5585F" },
--     CmpItemKindProperty = { fg = "#EED8DA", bg = "#B5585F" },
--     CmpItemKindEvent = { fg = "#EED8DA", bg = "#B5585F" },
--
--     CmpItemKindText = { fg = "#C3E88D", bg = "#9FBD73" },
--     CmpItemKindEnum = { fg = "#C3E88D", bg = "#9FBD73" },
--     CmpItemKindKeyword = { fg = "#C3E88D", bg = "#9FBD73" },
--
--     CmpItemKindConstant = { fg = "#FFE082", bg = "#D4BB6C" },
--     CmpItemKindConstructor = { fg = "#FFE082", bg = "#D4BB6C" },
--     CmpItemKindReference = { fg = "#FFE082", bg = "#D4BB6C" },
--
--     CmpItemKindFunction = { fg = "#EADFF0", bg = "#A377BF" },
--     CmpItemKindStruct = { fg = "#EADFF0", bg = "#A377BF" },
--     CmpItemKindClass = { fg = "#EADFF0", bg = "#A377BF" },
--     CmpItemKindModule = { fg = "#EADFF0", bg = "#A377BF" },
--     CmpItemKindOperator = { fg = "#EADFF0", bg = "#A377BF" },
--
--     CmpItemKindVariable = { fg = "#C5CDD9", bg = "#7E8294" },
--     CmpItemKindFile = { fg = "#C5CDD9", bg = "#7E8294" },
--
--     CmpItemKindUnit = { fg = "#F5EBD9", bg = "#D4A959" },
--     CmpItemKindSnippet = { fg = "#F5EBD9", bg = "#D4A959" },
--     CmpItemKindFolder = { fg = "#F5EBD9", bg = "#D4A959" },
--
--     CmpItemKindMethod = { fg = "#DDE5F5", bg = "#6C8ED4" },
--     CmpItemKindValue = { fg = "#DDE5F5", bg = "#6C8ED4" },
--     CmpItemKindEnumMember = { fg = "#DDE5F5", bg = "#6C8ED4" },
--
--     CmpItemKindInterface = { fg = "#D8EEEB", bg = "#58B5A8" },
--     CmpItemKindColor = { fg = "#D8EEEB", bg = "#58B5A8" },
--     CmpItemKindTypeParameter = { fg = "#D8EEEB", bg = "#58B5A8" },
-- }
