local nerd_font = require("main.icons.nerd_font")
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

local status_ok, mason, mason_lspconfig, lspconfig, signature

status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local mason_config = {
  ui = {
    check_outdated_packages_on_open = true,
    border = "rounded",
  }
}
mason.setup(mason_config)

status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
  return
end

local servers = {
  lua_ls = {
    Lua = {
      workspace = {
        checkThirdParty = false,
      },
      diagnostics = {
        globals = { 'vim' }
      }
    }
  },
  bashls = {},
  clangd = {},
  cmake = {},
  -- gopls = {},
  pyright = {},
  rust_analyzer = {},
  tsserver = {},
  vimls = {},
  zls = {},
}

status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

require('lspconfig.ui.windows').default_options.border = "rounded"
local on_attach = require("main.lsp_handlers").on_attach
local capabilities = require("main.lsp_handlers").capabilities

local mason_lspconfig_config = {
  ensure_installed = vim.tbl_keys(servers),
  automatic_installation = false,
}
mason_lspconfig.setup(mason_lspconfig_config)
mason_lspconfig.setup_handlers({
  function(server_name)
    local opts = {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = servers[server_name],
    }
    lspconfig[server_name].setup(opts)
  end,
})

status_ok, signature = pcall(require, "lsp_signature")
if not status_ok then
  return
end

local signature_config = {
  bind = true,
  wrap = true,
  floating_window = true,
  fix_pos = true,
  timer_interval = 50,
  handler_opts = {
    border = "rounded",
  },
}
signature.setup(signature_config)
