return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local default_terminal = {
			type = "terminal",
			command = nil,
			width = 69,
			height = 8,
			opts = {
				redraw = true,
				window_config = {},
			},
		}

		local default_header = {
			type = "text",
			val = {
				[[     ___        ___        ___        ___        ___        ___        ___        ___        ___     ]],
				[[    /  /\      /  /\      /__/\      /  /\      /__/\      /  /\      /__/\      /__/|      /  /\    ]],
				[[   /  /::\    /  /:/_     \  \:\    /  /:/     |  |::\    /  /::\     \  \:\    |  |:|     /  /::\   ]],
				[[  /  /:/\:\  /  /:/ /\     \  \:\  /  /::\     |  |:|:\  /  /:/\:\     \  \:\   |  |:|    /  /:/\:\  ]],
				[[ /  /:/~/::\/  /:/ /:/ _____\__\: /  /:/\:\  __|__|:|\: /  /:/~/:: _____\__\:\__|__|:|   /  /:/  \:\ ]],
				[[/__/:/ /:/\/__/:/ /:/ /__/:::::::/__/:/\ \:\/__/::::| \/__/:/ /:/\/__/::::::::__/::::\__/__/:/    \:\]],
				[[\  \:\/:/~/\  \:\/:/ /\  \:\~~\~~\__\/  \ \:\  \:\~~\__\  \:\/:/__\  \:\~~\~~/ ~\~~\::::\  \:\    /:/]],
				[[ \  \::/ /:/\  \::/ /:/\  \:\  ~~      /  /:/\  \:\     \  \::/    \  \:\  ~~~   |~~|:|~ \  \:\  /:/ ]],
				[[  \  \:\/:/  \  \:\/:/  \  \:\        /  /:/  \  \:\     \  \:\     \  \:\       |  |:|   \  \:\/:/  ]],
				[[   \  \::/    \  \::/    \  \:\      /__/:/    \  \:\     \  \:\     \  \:\      |  |:|    \  \::/   ]],
				[[    \__\/      \__\/      \__\/      \__\/      \__\/      \__\/      \__\/      |__|/      \__\/    ]],
			},
			opts = {
				position = "center",
				hl = "Type",
				-- wrap = "overflow";
			},
		}

		--- @param sc string
		--- @param txt string
		--- @param keybind string? optional
		--- @param keybind_opts table? optional
		local function button(sc, txt, keybind, keybind_opts)
			local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

			local opts = {
				position = "center",
				shortcut = sc,
				cursor = 5,
				width = 50,
				align_shortcut = "right",
				hl_shortcut = "Keyword",
			}
			if keybind then
				keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
				opts.keymap = { "n", sc_, keybind, keybind_opts }
			end

			local function on_press()
				local key = vim.api.nvim_replace_termcodes(keybind or sc_ .. "<Ignore>", true, false, true)
				vim.api.nvim_feedkeys(key, "t", false)
			end

			return {
				type = "button",
				val = txt,
				on_press = on_press,
				opts = opts,
			}
		end

		local buttons = {
			type = "group",
			val = {
				button("e", "  New file", "<cmd>ene <CR>"),
				button("SPC f f", "  Find file"),
				button("SPC f h", "  Recently opened files"),
				button("SPC f r", "  Frecency/MRU"),
				button("SPC f g", "  Find word"),
				button("SPC f m", "  Jump to bookmarks"),
				button("SPC s l", "  Open last session"),
			},
			opts = {
				spacing = 1,
			},
		}

		local footer = {
			type = "text",
			val = "",
			opts = {
				position = "center",
				hl = "Number",
			},
		}

		local section = {
			terminal = default_terminal,
			header = default_header,
			buttons = buttons,
			footer = footer,
		}

		require("alpha").setup({
			layout = {
				{ type = "padding", val = 8 },
				section.header,
				{ type = "padding", val = 2 },
				section.buttons,
				section.footer,
			},
			opts = {
				margin = 5,
			},
		})
	end,
}
