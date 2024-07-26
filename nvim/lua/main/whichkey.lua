local status_ok, whichkey = pcall(require, "which-key")
if not status_ok then
	return
end

local utils = require("main.general.utils")
vim.keymap.set("n", "<leader>?", utils.func_wrapper(whichkey.show, {global = false}), { desc = "[?] Whichkey Menu" })

local config = {
  delay = 500,
  win = {
    border = "rounded",
    title = false,
  }
}
whichkey.setup(config)
-- whichkey.register(vim.mappings, vim.opts)
