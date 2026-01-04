return {
	"rmagatti/goto-preview",
	keys = {
		{
			"<leader>gd",
			"<CMD>lua require('goto-preview').goto_preview_definition()<CR>",
			desc = "[P]review [D]efinition",
		},
		{
			"<leader>gt",
			"<CMD>lua require('goto-preview').goto_preview_type_definition()<CR>",
			desc = "[P]review [T]ype Definition",
		},
		{
			"<leader>gi",
			"<CMD>lua require('goto-preview').goto_preview_implementation()<CR>",
			desc = "[P]review [I]mplementation",
		},
		{
			"<leader>gD",
			"<CMD>lua require('goto-preview').goto_preview_declaration()<CR>",
			desc = "[P]review [D]eclaration",
		},
		{
			"<leader>gr",
			"<CMD>lua require('goto-preview').goto_preview_references()<CR>",
			desc = "[P]review [R]eferences",
		},
		{ "<leader>gC", "<CMD>lua require('goto-preview').close_all_win()<CR>", desc = "[P]revew [C]lose all windows" },
	},
	opts = {
		width = 120,
		height = 15,
		border = "rounded",
	},
}
