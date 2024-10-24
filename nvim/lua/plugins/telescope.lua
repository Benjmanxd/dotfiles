return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim",    build = "make" },
    { "nvim-telescope/telescope-file-browser.nvim" },
    { "nvim-telescope/telescope-live-grep-args.nvim" },
  },
  keys = {
    -- FIX: broken keymaps!!
    { "<leader>sf", "<CMD>Telescope find_files<CR>", desc = "[S]earch [F]iles" },
    -- vim.keymap.set("n", "<leader>sf", utils.func_wrapper(builtin.find_files, {cwd = vim.fn.expand('%:p:h')}), { desc = "[S]earch [F]iles" })
    { "<leader>sof", "<CMD>Telescope oldfiles<CR>", desc = "[S]earch [O]ld [F]iles" },
    { "<leader>st", "<CMD>Telescope help_tags<CR>", desc = "[S]earch [H]elp" },
    -- { "<leader>sw", "<CMD>Telescope grep_string<CR>", desc = "[S]earch current [W]ord" },
    { "<leader>sd", "<CMD>Telescope diagnostics<CR>", desc = "[S]earch [D]ianostics" },
    { "<leader>sb", "<CMD>Telescope buffers<CR>", desc = "[S]earch [B]uffers" },
    { "<leader>sw", "<CMD>Telescope live_grep_args live_grep_args<CR>", desc = "[S]earch by [G]rep" },
    { "<leader>sr", "<CMD>Telescope lsp_references<CR>", desc = "[S]earch [R]eferences" },
    { "<leader>/", "<CMD>Telescope current_buffer_fuzzy_find<CR>", desc = "[/] Fuzzily search in current buffer" },
    { "<leader>ds", "<CMD>Telescope lsp_document_symbols<CR>", desc = "[D]ocument [S]ymbols" },
    { "<leader>ws", "<CMD>Telescope lsp_dynamic_workspace_symbols<CR>", desc = "[W]orkspace [S]ymbols" },
    { "<leader>x", "<CMD>Telescope file_browser<CR>", noremap = true, desc = "Telescope File E[X]plorer" },
    { "<leader>sgc", "<CMD>Telescope git_commits<CR>", desc = "[S]earch [G]it [C]ommits" },
    { "<leader>sgb", "<CMD>Telescope git_branches<CR>", desc = "[S]earch [G]it [B]ranches" },
    { "<leader>sgs", "<CMD>Telescope git_status<CR>", desc = "[S]earch [G]it [S]tatus" },
    -- { "<leader>hh", "<CMD>Telescope harpoon marks<CR>", desc = "[H]arpoon List Toggle"},

  },
  opts = {
    defaults = {
      -- :help telescope.layout
      path_display = { truncate = 5 },
      selection_strategy = "reset",
      sorting_strategy = "ascending",
      scroll_strategy = "limit",
      color_devicons = true,
      layout_strategy = "horizontal",
      layout_config = {
        prompt_position = "top",
        height = 0.85,
        width = 0.85,
      },
      mappings = {
        i = {
          ["<ESC>"] = require("telescope.actions").close,
        },
      },
    },
    pickers = {
      find_files = {
        -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
        find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
      file_browser = {
        path_display = { truncate = 5 },
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        scroll_strategy = "limit",
        theme = "ivy",
        hijack_netrw = false,
      },
      live_grep_args = {
        auto_quoting = true,
      },
      harpoon = {},
    },
  },
  config = function(_, opts)
    local telescope = require("telescope")

    telescope.load_extension("fzf")
    telescope.load_extension("file_browser")
    telescope.load_extension("live_grep_args")
    -- telescope.load_extension("find_template")
    -- telescope.load_extension("harpoon")

    telescope.setup(opts)
  end,
}

--[[
** Default mappings **
Mappings 	    Action
<C-n>/<Down> 	Next item
<C-p>/<Up> 	    Previous item
j/k 	        Next/previous (in normal mode)
H/M/L 	        Select High/Middle/Low (in normal mode)
gg/G 	        Select the first/last item (in normal mode)
<CR> 	        Confirm selection
<C-x> 	        Go to file selection as a split
<C-v> 	        Go to file selection as a vsplit
<C-t> 	        Go to a file in a new tab
<C-u> 	        Scroll up in preview window
<C-d> 	        Scroll down in preview window
<C-/> 	        Show mappings for picker actions (insert mode)
? 	            Show mappings for picker actions (normal mode)
<C-c> 	        Close telescope
<Esc> 	        Close telescope (in normal mode)
<Tab> 	        Toggle selection and move to next selection
<S-Tab> 	    Toggle selection and move to prev selection
<C-q> 	        Send all items not filtered to quickfixlist (qflist)
<M-q> 	        Send all selected items to qflist
--]]
