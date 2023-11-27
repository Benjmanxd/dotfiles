-- vim command
-- vim.cmd("language en_US.utf8") --ui language
vim.cmd("cnoreabbrev h vert h")

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*" },
	command = "Format",
})

vim.api.nvim_create_autocmd({ "BufEnter", "VimEnter", "WinEnter", "BufWinEnter" }, {
	pattern = { "*" },
	callback = function(event)
		if not vim.bo[event.buf].buflisted then
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
