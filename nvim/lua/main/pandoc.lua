local status_ok, pandoc = pcall(require, "pandoc")
if not status_ok then
	return
end

local config = {
	commands = {
		name = "PandocBuild",
	},
	default = {
		output = "%s_output.pdf",
	},
	mappings = {
		-- normal mode
		n = {
			["<leader>pr"] = function()
				require("pandoc.render").init()
			end,
		},
	},
}

pandoc.setup(config)
