return {
	"jake-stewart/multicursor.nvim",
	branch = "1.0",
	config = function()
		local mc = require("multicursor-nvim")
		mc.setup()

		-- Add or skip cursor above/below the main cursor.
		vim.keymap.set({ "n", "x" }, "<M-k>", function() mc.lineAddCursor(-1) end)
		vim.keymap.set({ "n", "x" }, "<M-j>", function() mc.lineAddCursor(1) end)
		vim.keymap.set({ "n", "x" }, "<M-h>", function() mc.lineSkipCursor(-1) end)
		vim.keymap.set({ "n", "x" }, "<M-l>", function() mc.lineSkipCursor(1) end)
		-- Add or skip adding a new cursor by matching word/selection
		vim.keymap.set({ "n", "x" }, "<M-m>", function() mc.matchAddCursor(1) end)
		vim.keymap.set({ "n", "x" }, "<M-M>", function() mc.matchAddCursor(-1) end)
		vim.keymap.set({ "n", "x" }, "<M-n>", function() mc.searchAddCursor(1) end)
		vim.keymap.set({ "n", "x" }, "<M-N>", function() mc.searchAddCursor(-1) end)
		vim.keymap.set({ "n", "x" }, "<M-s>", function() mc.matchSkipCursor(1) end)
		vim.keymap.set({ "n", "x" }, "<M-S>", function() mc.matchSkipCursor(-1) end)
		vim.keymap.set({ "x" }, "<M-n>", mc.matchCursors)
		vim.keymap.set({ "n", "x" }, "<M-a>", mc.alignCursors)
		vim.keymap.set({ "n", "x" }, "<M-A>", mc.matchAllAddCursors)

		-- Disable and enable cursors.
		vim.keymap.set({ "n", "x" }, "<leader>m", mc.toggleCursor)
		--
		-- -- Mappings defined in a keymap layer only apply when there are
		-- -- multiple cursors. This lets you have overlapping mappings.
		mc.addKeymapLayer(function(layerSet)
			-- Select a different cursor as the main one.
			layerSet({ "n", "x" }, "<left>", mc.prevCursor)
			layerSet({ "n", "x" }, "<right>", mc.nextCursor)

			-- Delete the main cursor.
			layerSet({ "n", "x" }, "<M-d>", mc.deleteCursor)

			-- Enable and clear cursors using escape.
			layerSet("n", "<M-c>", function()
				if not mc.cursorsEnabled() then
					mc.enableCursors()
				else
					mc.clearCursors()
				end
			end)
		end)
	end,
}
