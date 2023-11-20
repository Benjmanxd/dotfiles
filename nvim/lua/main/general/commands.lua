-- vim command
vim.cmd("colorscheme neodarker") --colourscheme
-- vim.cmd "language en_US.utf8" --ui language
-- vim.cmd("highlight Normal guibg=none")
-- vim.cmd("highlight NonText guibg=none")

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*" },
	command = "Format",
})
