local status_ok, conform = pcall(require, "conform")
if not status_ok then
  return
end

vim.keymap.set("n", "<leader>f", conform.format, { desc = "[F]ormat", buffer = vim.bufnr, silent = true })

local config = {
  formatters_by_ft = {
    go = { "gofmt" },
    javascript = { "prettier" },
    lua = { "stylua" },
    python = { "black" },
    rust = { "rustfmt" },
    cmake = { "cmake_format" },
    cpp = { "clang-format" },
  }
}
conform.setup(config)
