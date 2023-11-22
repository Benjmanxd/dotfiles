-- vim command
vim.cmd("language en_US.utf8") --ui language
vim.cmd([[
let g:neodark#terminal_transparent = 1
let g:neodark#italics = 1
]])

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*" },
	command = "Format",
})

vim.api.nvim_create_autocmd({ "BufEnter", "VimEnter", "WinEnter", "BufWinEnter" }, {
	pattern = { "*" },
	callback = function()
		local listed = vim.api.nvim_get_option_value("buflisted", { scope = "local" })
		if not listed then
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
