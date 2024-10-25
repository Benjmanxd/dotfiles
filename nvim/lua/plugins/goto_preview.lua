return {
	"rmagatti/goto-preview",
  keys = {
    { "<leader>pd", "<CMD>lua require('goto-preview').goto_preview_definition()<CR>", desc = "[P]review [D]efinition" },
    { "<leader>pt", "<CMD>lua require('goto-preview').goto_preview_type_definition()<CR>", desc = "[P]revew [T]ype Definition" },
    { "<leader>pi", "<CMD>lua require('goto-preview').goto_preview_implementation()<CR>", desc = "[P]revew [I]mplementation" },
    { "<leader>pD", "<CMD>lua require('goto-preview').goto_preview_declaration()<CR>", desc = "[P]revew [D]eclaration" },
    { "<leader>pr", "<CMD>lua require('goto-preview').goto_preview_references()<CR>", desc = "[P]revew [R]eferences" },
    { "<leader>pC", "<CMD>lua require('goto-preview').close_all_win()<CR>", desc = "[P]revew [C]lose all windows" },
  },
	opts = {
		width = 120,
		height = 15,
		border = "rounded",
	},
}
