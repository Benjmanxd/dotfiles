local status_ok, harpoon = pcall(require, "harpoon")
if not status_ok then
  return
end

harpoon:setup()

vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end, { desc = "[H]arpoon List [A]ppend" })
vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
  { desc = "[H]arpoon List Toggle" })
vim.keymap.set("n", "<leader>hz", function() harpoon:list():select(1) end, { desc = "[H]arpoon List item 1"})
vim.keymap.set("n", "<leader>hx", function() harpoon:list():select(2) end, { desc = "[H]arpoon List item 2"})
vim.keymap.set("n", "<leader>hc", function() harpoon:list():select(3) end, { desc = "[H]arpoon List item 3"})
vim.keymap.set("n", "<leader>hv", function() harpoon:list():select(4) end, { desc = "[H]arpoon List item 4"})
