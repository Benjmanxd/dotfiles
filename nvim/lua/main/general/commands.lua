-- vim command
-- vim.cmd("language en_US.utf8") --ui language
vim.cmd("cnoreabbrev h vert h")

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "plugins.lua",
	callback = function()
		vim.cmd("Lazy clean")
		vim.cmd("Lazy update")
		vim.cmd("write")
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "VimEnter", "WinEnter", "BufWinEnter" }, {
	pattern = { "*" },
	callback = function(event)
		if not vim.bo[event.buf].buflisted then
			vim.cmd("setlocal nocursorline")
			vim.cmd("setlocal nocursorcolumn")
    else
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

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local buf = vim.lsp.buf
    local opts_buf = ev.buf
    vim.keymap.set("n", "<leader>rn", buf.rename, { desc = "[R]e[n]ame", buffer = ev.buf })
    vim.keymap.set("n", "<leader>ca", buf.code_action, { desc = "[C]ode [A]ction", buffer = opts_buf })
    vim.keymap.set("n", "gD", buf.declaration, { desc = "[G]oto [D]eclaration", buffer = opts_buf })
    vim.keymap.set("n", "gd", buf.definition, { desc = "[G]oto [D]efinition", buffer = opts_buf })
    vim.keymap.set("n", "gi", buf.implementation, { desc = "[G]oto [I]mplementation", buffer = opts_buf })
    vim.keymap.set("n", "gt", buf.type_definition, { desc = "[G]oto [T]ype Definition", buffer = opts_buf })
    vim.keymap.set("n", "gh", buf.hover, { desc = "[G]oto [H]over", buffer = opts_buf })
    vim.keymap.set("n", "gr", buf.references, { desc = "[G]oto [R]eferences", buffer = opts_buf })
    vim.keymap.set("n", "gs", buf.signature_help, { desc = "[G]oto [S]ignature Help", buffer = opts_buf })
    vim.keymap.set("n", "<leader>f", function()
      buf.format({ async = true })
    end, { desc = "[F]ormat", buffer = opts_buf })
  end,
})
