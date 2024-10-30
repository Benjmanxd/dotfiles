local utils = require("general.utils")
local palette = require("general.palette")

-- vim.cmd("language en_US.utf8") --ui language
vim.cmd("cnoreabbrev h vert h")

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "lazy.lua",
	callback = function()
		vim.cmd("Lazy clean")
		vim.cmd("Lazy update")
		vim.cmd("write")
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "VimEnter", "WinEnter", "BufWinEnter" }, {
	pattern = { "*" },
	callback = function(event)
		-- set cursorline & cursorcolumn
		if vim.bo[event.buf].buflisted then
			vim.cmd("setlocal cursorline")
			vim.cmd("setlocal cursorcolumn")
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

vim.api.nvim_create_autocmd({ "BufEnter", "VimEnter", "WinEnter", "BufWinEnter" }, {
	pattern = { "*" },
	callback = function()
		-- set icon highlight
		local icon_ok, icons = pcall(require, "nvim-web-devicons")
		if not icon_ok then
			return
		end
		local filename = vim.fn.expand("%:t")
		local ext = vim.fn.expand("%:e")
		local _, icon_name = icons.get_icon(filename, ext, { default = true })
		local _, icon_color = icons.get_icon_color(filename, ext, { default = true })
		if not icon_name then
			return
		end
		local iconSkeleton = {
			["BufferLine" .. icon_name .. "Selected"] = {
				bg = palette.bg,
				fg = icon_color,
			},
			["BufferLine" .. icon_name] = {
				bg = palette.bg_1,
				fg = palette.fg,
			},
			["BufferLine" .. icon_name .. "Inactive"] = {
				bg = palette.bg_1,
				fg = icon_color,
			},
		}
		utils.set_theme(iconSkeleton)
	end,
})
