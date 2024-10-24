return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		delay = 500,
		win = {
			border = "rounded",
			title = false,
		},
	},
  config = function(_, opts)
    local whichkey = require("which-key")
    local utils = require("general.utils")
    vim.keymap.set("n", "<leader>?", utils.func_wrapper(whichkey.show, {global = false}), { desc = "[?] Whichkey Menu" })
    whichkey.setup(opts)
  end,
}
