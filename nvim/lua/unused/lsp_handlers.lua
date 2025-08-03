local M = {}
local buf = vim.lsp.buf

M.capabilities = require("cmp_nvim_lsp").default_capabilities()

local function lsp_keymaps(bufnr)
  local lsp_sig = require("lsp_signature")
  vim.keymap.set("n", "<leader>rn", buf.rename, { desc = "[R]e[n]ame", buffer = bufnr, silent = true })
  vim.keymap.set("n", "<leader>ca", buf.code_action, { desc = "[C]ode [A]ction", buffer = bufnr, silent = true })
  vim.keymap.set("n", "gD", buf.declaration, { desc = "[G]oto [D]eclaration", buffer = bufnr, silent = true })
  vim.keymap.set("n", "gd", buf.definition, { desc = "[G]oto [D]efinition", buffer = bufnr, silent = true })
  vim.keymap.set("n", "gi", buf.implementation, { desc = "[G]oto [I]mplementation", buffer = bufnr, silent = true })
  vim.keymap.set("n", "gt", buf.type_definition, { desc = "[G]oto [T]ype Definition", buffer = bufnr, silent = true })
  vim.keymap.set("n", "gh", buf.hover, { desc = "[G]oto [H]over", buffer = bufnr, silent = true })
  vim.keymap.set("n", "gr", buf.references, { desc = "[G]oto [R]eferences", buffer = bufnr, silent = true })
  vim.keymap.set("n", "gs", lsp_sig.toggle_float_win, { desc = "[G]oto [S]ignature Help", buffer = bufnr, silent = true })
  -- vim.keymap.set("n", "<leader>f", function()
  --   buf.format({ async = true })
  -- end, { desc = "[F]ormat", buffer = bufnr, silent = true })
end

-- NOTE: vim-illuminate seems work much better than DocumentHighlight provided by vim.lsp
-- local function lsp_highlight(client, bufnr)
  -- if client.server_capabilities.documentHighlightProvider then
  --   vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
  --   vim.api.nvim_clear_autocmds { buffer = bufnr, group = "lsp_document_highlight" }
  --   vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  --     callback = vim.lsp.buf.document_highlight,
  --     buffer = bufnr,
  --     group = "lsp_document_highlight",
  --     desc = "Document Highlight",
  --   })
  --   vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
  --     callback = vim.lsp.buf.clear_references,
  --     buffer = bufnr,
  --     group = "lsp_document_highlight",
  --     desc = "Clear All the References",
  --   })
  -- end
-- end

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
  -- lsp_highlight(client, bufnr)
end

return M
