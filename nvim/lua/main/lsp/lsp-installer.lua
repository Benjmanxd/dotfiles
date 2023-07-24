local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
  return
end

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
  return
end

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

mason.setup()

local util = lspconfig.util
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
  fortls = {
    default_config = {
      cmd = {
        'fortls',
        '--lowercase_intrisics',
        '--hover_signature',
        '--hover_language=fortran90',
        '--use_signature_help',
        '--incrmental_sync',
        '--autocomplete_no_prefix'
      },
      filetypes = { 'fortran' },
      root_dir = function(fname)
        return util.root_pattern '.fortls'(fname) or util.find_git_ancestor(fname)
      end,
      settings = {
        variableHover = true
      },
    },
    docs = {
      default_config = {
        root_dir = [[root_pattern(".fortls")]],
      },
    }
  },
  clangd = {},
  tsserver = {},
  bashls = {},
  cssls = {},
  dockerls = {},
  html = {},
  jsonls = {},
  pyright = {},
  rust_analyzer = {},
}

local mason_lspconfig_config = {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup(mason_lspconfig_config)
mason_lspconfig.setup_handlers {
  function(server_name)
    lspconfig[server_name].setup {
      settings = servers[server_name],
    }
  end,
}
