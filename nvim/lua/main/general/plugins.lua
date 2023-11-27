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
lazy.setup({
	-- ui
	{ "goolord/alpha-nvim", lazy = true, dependencies = { "nvim-tree/nvim-web-devicons" } }, -- greeter
	{ "norcalli/nvim-colorizer.lua", lazy = true },
	{ "lukas-reineke/indent-blankline.nvim" },

	-- completetion, snippet
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp-document-symbol",
			"saadparwaiz1/cmp_luasnip",
		},
	},
	{ "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } },
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},

	-- file, fuzzy
	{ "nvim-telescope/telescope.nvim", lazy = true, branch = "0.1.x", dependencies = { { "nvim-lua/plenary.nvim" } } }, -- searcher
	{ "nvim-telescope/telescope-fzf-native.nvim", lazy = true, build = "make" },
	{
		"nvim-telescope/telescope-file-browser.nvim",
		lazy = true,
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
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
	{ "windwp/nvim-autopairs", event = "InsertEnter" }, -- pair symbol automation
	{
		"nvim-treesitter/nvim-treesitter",
		version = nil,
	}, -- code highlighter
	{ "stevearc/aerial.nvim" }, -- code symbol
	{ "mhartington/formatter.nvim" }, -- code formatter
	{ "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } }, -- error, warning
	{ "numToStr/Comment.nvim" }, -- comments
	{ "rcarriga/nvim-dap-ui", lazy = true, dependencies = { "mfussenegger/nvim-dap" } }, -- debug
	{ "folke/which-key.nvim" },
	{ "mg979/vim-visual-multi" },

	-- buffer, status
	{ "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons", opt = true } }, -- neovim status
	{ "akinsho/bufferline.nvim", dependencies = "nvim-tree/nvim-web-devicons" }, -- neovim buffer
	{ "akinsho/toggleterm.nvim", lazy = true }, -- terminal

	-- git
	{ "tpope/vim-fugitive" }, -- git function
})
