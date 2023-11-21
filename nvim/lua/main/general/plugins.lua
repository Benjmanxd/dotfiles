local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	print("Installing packer, close and reopon Neovim ...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save plugins.lua
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]])

-- Use a protected call so won't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- packer popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install plugins
return packer.startup(function(use)
	-- Put all plugins under this line
	-- packer
	use("wbthomason/packer.nvim")

	-- colourscheme, ui
	-- use("VDuchauffour/neodark.nvim") -- theme
	use("KeitaNakamura/neodark.vim")
	use({ "goolord/alpha-nvim", requires = { "nvim-tree/nvim-web-devicons" } }) -- greeter
	use("norcalli/nvim-colorizer.lua")

	-- completetion, snippet
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp-document-symbol",
			"saadparwaiz1/cmp_luasnip",
		},
	})
	use({ "L3MON4D3/LuaSnip", require = { "rafamadriz/friendly-snippets" } })
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})

	-- file, fuzzy
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x", requires = { { "nvim-lua/plenary.nvim" } } }) -- searcher
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})
	use({
		"nvim-neo-tree/neo-tree.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- optional image support in preview window
		},
	}) -- tree

	-- code editting
	use("windwp/nvim-autopairs") -- pair symbol automation
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	}) -- code highlighter
	use("stevearc/aerial.nvim") -- code symbol
	use("mhartington/formatter.nvim") -- code formatter
	use({ "folke/trouble.nvim", requires = { "nvim-tree/nvim-web-devicons" } }) -- error, warning
	use("numToStr/Comment.nvim") -- comments
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }) -- debug

	-- buffer, status
	use({ "nvim-lualine/lualine.nvim", requires = { "nvim-tree/nvim-web-devicons", opt = true } }) -- neovim status
	use({ "akinsho/bufferline.nvim", requires = "nvim-tree/nvim-web-devicons" }) -- neovim buffer
	use("akinsho/toggleterm.nvim") -- terminal

	-- git
	use("tpope/vim-fugitive") -- git function

	-- Automcatically setup configuration after cloning packer.nvim, put this after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
