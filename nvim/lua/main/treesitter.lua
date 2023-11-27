local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

local config = {
	ensure_installed = { -- one of "all" or a list of languages
		"bash",
		"c",
		"cmake",
		"cpp",
		"dockerfile",
		"erlang",
		"fish",
		"git_config",
		"git_rebase",
		"gitattributes",
		"gitcommit",
		"gitignore",
		"go",
		"groovy",
		"haskell",
		"hcl",
		"html",
		"http",
		"ini",
		"java",
		"javascript",
		"jq",
		"jsdoc",
		"kotlin",
		"latex",
		"llvm",
		"lua",
		"make",
		"markdown",
		"nix",
		"ocaml",
		"python",
		"regex",
		"ruby",
		"rust",
		"solidity",
		"sql",
		"swift",
		"terraform",
		"toml",
		"yaml",
		"zig",
	},
	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = false, -- false will disable the whole extension
		additional_vim_regex_highlighting = false,
		disable = { "css" }, -- list of language that will be disabled
	},
}

treesitter.setup(config)
