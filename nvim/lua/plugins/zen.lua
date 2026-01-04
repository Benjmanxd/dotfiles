return {
	"folke/zen-mode.nvim",
	keys = {
		{ "<leader>z", "<CMD>ZenMode<CR>", desc = "[Z]en Mode" },
	},
	opts = {
		window = {
			backdrop = 0.5,
			options = {
				signcolumn = "no", -- disable signcolumn
				number = false, -- disable number column
				relativenumber = false, -- disable relative numbers
				cursorline = false, -- disable cursorline
				cursorcolumn = false, -- disable cursor column
				foldcolumn = "0", -- disable fold column
				-- list = false, -- disable whitespace characters
			},
		},
		plugins = {
			tmux = { enabled = false },
			alacritty = { enabled = false, font = "16" },
		},
	},
}
