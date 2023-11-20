-- vim command
vim.cmd("colorscheme neodarker") --colourscheme
-- vim.cmd "language en_US.utf8" --ui language
-- vim.cmd("highlight Normal guibg=none")
-- vim.cmd("highlight NonText guibg=none")

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*" },
	command = "Format",
})

vim.api.nvim_create_autocmd({ "BufEnter", "VimEnter", "WinEnter", "BufWinEnter" }, {
	pattern = { "*" },
	callback = function()
		local listed = vim.api.nvim_get_option_value("buflisted", { scope = "local" })
		if listed then
			vim.cmd("setlocal cursorline")
			vim.cmd("setlocal cursorcolumn")
		else
			vim.cmd("setlocal nocursorline")
			vim.cmd("setlocal nocursorcolumn")
		end
	end,
})

vim.api.nvim_create_autocmd({ "WinLeave" }, {
	pattern = { "*" },
	callback = function()
		vim.cmd("setlocal nocursorline")
		vim.cmd("setlocal nocursorcolumn")
	end,
})
