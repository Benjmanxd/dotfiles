local diag = vim.diagnostic

-- space as leader key
vim.keymap.set("", "<Space>", "<Nop>", { noremap = true, silent = true })

-- Modes
-- normal_mode = "n"
-- insert_mode = "i"
-- visual_mode = "v"
-- visual_block_mode = "x"
-- term_mode = "t"
-- command_mode = "c"

-- <CR> -> enter

-- Normal mode
-- explorernoremap = true, silent = tru
--vim.keymap.set("n", "<leader>x", ":Lex 30<CR>", opts)
-- buffer navigation
vim.keymap.set("n", "<leader>bn", "<CMD>bnext<CR>", { desc = "[B]uffer [N]ext", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bp", "<CMD>bprevious<CR>", { desc = "[B]uffer [P]revious", noremap = true, silent = true })
-- window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "[W]indow [H](left)", noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "[W]indow [L](right)", noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "[W]indow [J](down)", noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "[W]indow [K](up)", noremap = true, silent = true })
-- window resize
vim.keymap.set("n", "<C-Up>", "<CMD>resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Down>", "<CMD>resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Right>", "<CMD>vertical resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Left>", "<CMD>vertical resize -2<CR>", { noremap = true, silent = true })
-- cursor navigation
--vim.keymap.set("n", "W", "$", opts)
--vim.keymap.set("n", "B", "^", opts)
-- move line up and down
vim.keymap.set("n", "<C-S-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<C-S-k>", ":m .-2<CR>==", { noremap = true, silent = true })
-- indentation
vim.keymap.set("n", "<", "<<", { desc = "Ident left", noremap = true, silent = true })
vim.keymap.set("n", ">", ">>", { desc = "Ident right", noremap = true, silent = true })

-- Diagnostics
-- FIX: broken keymaps
vim.keymap.set("n", "[d", diag.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", diag.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "gl", diag.open_float, { desc = "Open flating diagnostic message" })
vim.keymap.set("n", "<leader>q", diag.setloclist, { desc = "Open diagnostic list" })

-- Lsp
vim.keymap.set("n", "<leader>f", require("conform").format, { desc = "[F]ormat", buffer = bufnr, silent = true })

-- Visual mode
-- indentation
vim.keymap.set("v", "<", "<gv", { desc = "Ident left", noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { desc = "Ident right", noremap = true, silent = true })
-- move text up and down
vim.keymap.set("v", "<C-S-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<C-S-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "p", '"_dP', { noremap = true, silent = true })
