return {
	"saghen/blink.cmp",
	version = "*",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		{ "L3MON4D3/LuaSnip", version = "v2.*" },
		"moyiz/blink-emoji.nvim",
	},
	opts = {
		completion = {
			menu = {
				scrollbar = false,
				draw = {
					gap = 1,
					columns = {
						{ "kind_icon" },
						{ "label" },
						{ "source_name" },
					},
					components = {
						label = {
							width = { fill = true, max = 40 },
						},
					},
					treesitter = { "lsp" },
				},
				border = "rounded",
			},
			ghost_text = {
				enabled = false,
			},
			documentation = {
				auto_show = false,
				window = {
					border = "rounded",
				},
				treesitter_highlighting = true,
			},
		},
		cmdline = {
			keymap = { preset = "inherit" },
			completion = {
				menu = {
					auto_show = function(ctx) return vim.fn.getcmdtype() == ":" end,
				},
			},
		},
		signature = {
			enabled = true,
			window = {
				border = "rounded",
				treesitter_highlighting = true,
			},
		},
		keymap = {
			["<Down>"] = { "select_next", "fallback" },
			["<Up>"] = { "select_prev", "fallback" },
			["<C-n>"] = { "select_next", "fallback_to_mappings" },
			["<C-p>"] = { "select_prev", "fallback_to_mappings" },
			["<C-y>"] = { "select_and_accept", "fallback" },
			["<C-e>"] = { "cancel", "fallback" },

			["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
			["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
			["<CR>"] = { "select_and_accept", "fallback" },
			-- ["<Esc>"] = { "cancel", "hide_documentation", "fallback" },

			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },

			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },

			["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
		},
		sources = {
			default = {
				"lsp",
				"path",
				"snippets",
				"buffer",
				"emoji",
			},
			providers = {
				emoji = {
					module = "blink-emoji",
					name = "Emoji",
					score_offset = 15,
					opts = {
						insert = true,
						trigger = ":",
					},
					should_show_items = function()
						return vim.tbl_contains({ "gitcommit", "markdown", "text" }, vim.o.filetype)
					end,
				},
				lsp = {
					module = "blink.cmp.sources.lsp",
					min_keyword_length = 0,
					score_offset = 90,
				},
				buffer = {
					module = "blink.cmp.sources.buffer",
					score_offset = 15,
					opts = {
						-- get all buffers, even ones like neo-tree
						-- get_bufnrs = vim.api.nvim_list_bufs,
						-- or (recommended) filter to only "normal" buffers
						get_bufnrs = function()
							return vim.tbl_filter(
								function(bufnr) return vim.bo[bufnr].buftype == "" end,
								vim.api.nvim_list_bufs()
							)
						end,
					},
				},
				path = {
					module = "blink.cmp.sources.path",
					score_offset = 10,
					opts = {
						get_cwd = function(_) return vim.fn.getcwd() end,
						ignore_root_slash = false,
					},
				},
				cmdline = {
					module = "blink.cmp.sources.cmdline",
					min_keyword_length = function(ctx)
						-- when typing a command, only show when the keyword is 4 characters or longer
						if ctx.mode == "cmdline" and string.find(ctx.line, " ") == nil then return 4 end
						return 0
					end,
				},
			},
		},
		snippets = { preset = "luasnip" },
		fuzzy = {
			implementation = "prefer_rust_with_warning",
			sorts = {
				"exact",
				"score",
				"sort_text",
			},
		},
	},
}
