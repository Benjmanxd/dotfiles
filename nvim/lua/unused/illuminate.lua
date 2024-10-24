local status_ok, illuminate = pcall(require, "illuminate")
if not status_ok then
  return
end

local config = {
  providers = {
    'lsp',
    'treesitter',
    'regex'
  },
  delay = 100,
  filetypes_denylist = {
    'fugitive',
    'neo-tree',
  }
}

illuminate.configure(config)
