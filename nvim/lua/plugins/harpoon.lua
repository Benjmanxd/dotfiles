return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	config = function()
		-- WARNING: REQUIRED
		require("harpoon"):setup()
	end,
	keys = function()
		local harpoon = require("harpoon")
		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
					attach_mappings = function(prompt_buffer_number, map)
						local make_finder = function()
							local paths = {}
							for _, item in ipairs(harpoon_files.items) do
								table.insert(paths, item.value)
							end
							return require("telescope.finders").new_table({
								results = paths,
							})
						end
						-- The keymap you need
						map("i", "<c-d>", function()
							local state = require("telescope.actions.state")
							local selected_entry = state.get_selected_entry()
							local current_picker = state.get_current_picker(prompt_buffer_number)

							-- This is the line you need to remove the entry
							harpoon:list():remove(selected_entry)
							current_picker:refresh(make_finder())
						end)
						return true
					end,
				})
				:find()
		end

		return {
			{
				"<leader>a",
				function() harpoon:list():add() end,
				desc = "Harpoon add entry",
			},
			-- { "<leader>l", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Harpoon list entries" },
			{
				"<leader>p",
				function() harpoon:list():prev() end,
				desc = "Harpoon prev entry",
			},
			{
				"<leader>n",
				function() harpoon:list():next() end,
				desc = "Harpoon next entry",
			},
			{
				"<leader>b",
				function() toggle_telescope(harpoon:list()) end,
				desc = "Telescope Harpoon list entries",
			},
			-- { "<C-h>", function() harpoon:list():select(1) end, desc = "Harpoon select entry 1" },
			-- { "<C-t>", function() harpoon:list():select(2) end, desc = "Harpoon select entry 2" },
			-- { "<C-n>", function() harpoon:list():select(3) end, desc = "Harpoon select entry 3" },
			-- { "<C-s>", function() harpoon:list():select(4) end, desc = "Harpoon select entry 4" },
		}
	end,
}
