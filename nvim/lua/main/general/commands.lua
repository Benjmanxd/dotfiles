-- vim command
vim.cmd "colorscheme neodark" --colourscheme
--vim.cmd "language en_US.utf8" --ui language

vim.api.nvim_create_autocmd({"BufWritePost"}, {
  pattern = {"*"},
  command = "Format",
})
