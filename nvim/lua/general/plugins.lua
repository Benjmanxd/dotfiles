local plugins = {
  {
    "rmagatti/goto-preview",
    lazy = true
  },

  -- code editting
  {
    "rcarriga/nvim-dap-ui",
    lazy = true,
    dependencies = { "mfussenegger/nvim-dap" }
  }, -- debug
  {
    "glepnir/template.nvim",
    cmd = {'Template', 'TemProject'}
  }, -- templates

  -- web dev
  {
    "rest-nvim/rest.nvim",
    lazy = true,
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    "ThePrimeagen/harpoon",
    lazy = true,
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}
