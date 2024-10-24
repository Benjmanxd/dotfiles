return {
  "neovim/nvim-lspconfig",
  init = function()
    local nerd_font = require("general.icons.nerd_font")
    local signs = {
        { name = "DiagnosticSignError", text = nerd_font["DiagnosticError"] },
        { name = "DiagnosticSignWarn", text = nerd_font["DiagnosticWarn"] },
        { name = "DiagnosticSignHint", text = nerd_font["DiagnosticHint"] },
        { name = "DiagnosticSignInfo", text = nerd_font["DiagnosticInfo"] },
    }
    for _, sign in ipairs(signs) do
      vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local vim_diag_config = {
      virtual_text = false,
      signs = {
        active = signs,
      },
      update_in_insert = true,
      underline = false,
      severity_sort = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    }
    vim.diagnostic.config(vim_diag_config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
    })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = "rounded",
    })
  end,
}
