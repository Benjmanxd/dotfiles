-- Automatically install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so won't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end

-- Install plugins
local plugins = {
  -- ui
  {
    "goolord/alpha-nvim",
    lazy = true,
    dependencies = { "nvim-tree/nvim-web-devicons" }
  }, -- greeter
  {
    "norcalli/nvim-colorizer.lua",
    lazy = true
  },
  { "lukas-reineke/indent-blankline.nvim" },

  -- LSP
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "uga-rosa/cmp-dictionary",
      "hrsh7th/cmp-emoji",
      "petertriho/cmp-git",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
  },
  {
    "rmagatti/goto-preview",
    lazy = true
  },

  -- file, fuzzy
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    branch = "0.1.x",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim",    build = "make" },
      { "nvim-telescope/telescope-file-browser.nvim" },
      { "nvim-telescope/telescope-live-grep-args.nvim" },
    }
  }, -- searcher
  {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- optional image support in preview window
    },
  }, -- tree

  -- code editting
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter"
  }, -- pair symbol automation
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "RRethy/vim-illuminate" }
  },                           -- code highlighter
  -- { "stevearc/aerial.nvim" }, -- code symbol
  { "numToStr/Comment.nvim" }, -- comments
  {
    "rcarriga/nvim-dap-ui",
    lazy = true,
    dependencies = { "mfussenegger/nvim-dap" }
  }, -- debug
  { "folke/which-key.nvim" },
  { "mg979/vim-visual-multi" },
  {
    "folke/todo-comments.nvim",
    lazy = true,
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  -- web dev
  {
    "rest-nvim/rest.nvim",
    lazy = true,
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  -- buffer, status
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", opt = true }
  }, -- neovim status
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }
  }, -- neovim buffer
  {
    "akinsho/toggleterm.nvim",
    lazy = true
  }, -- terminal
  {
    "ThePrimeagen/harpoon",
    lazy = true,
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- git
  {
    "tpope/vim-fugitive",
  }, -- git function
}

local options = {
  ui = {
    size = { width = 0.8, height = 0.8 },
    wrap = true,
    border = "rounded",
    title = " 👑Laazzzyyyy!!!!!👑 ",
    title_pos = "center",
  },
  checker = {
    enabled = false,
  },
  change_detection = {
    enabled = false,
    notify = false,
  },
}

lazy.setup(plugins, options)
