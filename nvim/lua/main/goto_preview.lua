local status_ok, goto_preview = pcall(require, "goto-preview")
if not status_ok then
	return
end

vim.keymap.set("n", "<leader>pd", goto_preview.goto_preview_definition, { desc = "[P]review [D]efinition" })
vim.keymap.set("n", "<leader>pt", goto_preview.goto_preview_type_definition, { desc = "[P]revew [T]ype Definition" })
vim.keymap.set("n", "<leader>pi", goto_preview.goto_preview_implementation, { desc = "[P]revew [I]mplementation" })
vim.keymap.set("n", "<leader>pD", goto_preview.goto_preview_declaration, { desc = "[P]revew [D]eclaration" })
vim.keymap.set("n", "<leader>pr", goto_preview.goto_preview_references, { desc = "[P]revew [R]eferences" })
vim.keymap.set("n", "<leader>pC", goto_preview.close_all_win, { desc = "[P]revew [C]lose all windows" })

local config = {
	width = 120,
	height = 15,
	border = "rounded",
}

goto_preview.setup(config)
