return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- optional image support in preview window
  },
  keys = {
    { "<leader>nf", "<CMD>Neotree filesystem toggle<CR>", noremap = true, desc = "[N]eotree [F]ilesystem" },
    { "<leader>nb", "<CMD>Neotree buffers toggle<CR>", noremap = true, desc = "[N]eotree [B]uffers" },
    { "<leader>ng", "<CMD>Neotree git_status toggle<CR>", noremap = true, desc = "[N]eotree [G]it status" },
    { "<leader>ns", "<CMD>Neotree document_symbols toggle<CR>", noremap = true, desc = "[N]eotree [D]ocument symbols" },
  },
  init = function()
    vim.g.neo_tree_remove_legacy_commands = 1

    local utils = require("general.utils")
    vim.fn.sign_define("DiagnosticSignError", { text = utils.get_icon("DiagnosticError"), texthl = "DiagnosticSignError" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = utils.get_icon("DiagnosticWarn"), texthl = "DiagnosticSignWarn" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = utils.get_icon("DiagnosticInfo"), texthl = "DiagnosticSignInfo" })
    vim.fn.sign_define("DiagnosticSignHint", { text = utils.get_icon("DiagnosticHint"), texthl = "DiagnosticSignHint" })
  end,
  opts = function()
    local utils = require("general.utils")
    return {
      close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      sort_case_insensitive = false, -- used when sorting files and directories in the tree
      sort_function = nil,           -- use a custom function for sorting files and directories in the tree
      -- sort_function = function (a,b)
      --       if a.type == b.type then
      --           return a.path > b.path
      --       else
      --           return a.type > b.type
      --       end
      --   end , -- this sorts files and directories descendantly
      sources = {
        "filesystem",
        "buffers",
        "git_status",
        "document_symbols",
      },
      source_selector = {
        winbar = true,
        statusline = false,
        content_layout = "center",
        sources = {
          { source = "filesystem",       display_name = utils.get_icon("FolderClosed") },
          { source = "buffers",          display_name = utils.get_icon("DefaultFile") },
          { source = "git_status",       display_name = utils.get_icon("GitBranch") },
          { source = "document_symbols", display_name = utils.get_icon("Symbol") },
        },
        separator = { left = "▏", right = "▕" },
        highlight_tab = "NeoTreeTabInactive",
        highlight_tab_active = "NeoTreeTabActive",
        highlight_background = "NeoTreeTabInactive",
        highlight_separator = "NeoTreeTabSeparatorInactive",
        highlight_separator_active = "NeoTreeTabSeparatorActive",
      },
      default_component_configs = {
        container = {
          enable_character_fade = true,
        },
        indent = {
          indent_size = 2,
          padding = 2, -- extra padding on left hand side
          -- indent guides
          with_markers = true,
          indent_marker = "│",
          last_indent_marker = "└",
          highlight = "NeoTreeIndentMarker",
          -- expander config, needed for nesting files
          with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = utils.get_icon("FolderCollapsed"),
          expander_expanded = utils.get_icon("FolderExpanded"),
          expander_highlight = "NeoTreeExpander",
        },
        icon = {
          folder_closed = utils.get_icon("FolderClosed"),
          folder_open = utils.get_icon("FolderOpen"),
          folder_empty = utils.get_icon("FolderEmpty"),
          default = utils.get_icon("DefaultFile"),
          highlight = "NeoTreeFileIcon",
        },
        modified = {
          symbol = utils.get_icon("FileModified"),
          highlight = "NeoTreeModified",
        },
        name = {
          trailing_slash = false,
          use_git_status_colors = true,
          highlight = "NeoTreeFileName",
        },
        git_status = {
          symbols = {
            added = utils.get_icon("GitAdd"),
            deleted = utils.get_icon("GitDelete"),
            modified = utils.get_icon("GitChange"),
            renamed = utils.get_icon("GitRenamed"),
            untracked = utils.get_icon("GitUntracked"),
            ignored = utils.get_icon("GitIgnored"),
            unstaged = utils.get_icon("GitUnstaged"),
            staged = utils.get_icon("GitStaged"),
            conflict = utils.get_icon("GitConflict"),
          },
        },
      },
      window = {
        position = "left",
        width = 40,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
        mappings = {
          ["<space>"] = {
            "toggle_node",
            nowait = true, -- disable `nowait` if you have existing combos starting with this char that you want to use
          },
          ["<2-LeftMouse>"] = "open",
          --["<cr>"] = "open",
          ["o"] = "open",
          ["<esc>"] = "revert_preview",
          ["P"] = { "toggle_preview", config = { use_float = true } },
          ["S"] = "open_split",
          ["s"] = "open_vsplit",
          -- ["S"] = "split_with_window_picker",
          -- ["s"] = "vsplit_with_window_picker",
          ["t"] = "open_tabnew",
          -- ["<cr>"] = "open_drop",
          -- ["t"] = "open_tab_drop",
          ["w"] = "open_with_window_picker",
          --["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
          ["C"] = "close_node",
          ["z"] = "close_all_nodes",
          ["Z"] = "expand_all_nodes",
          ["a"] = {
            "add",
            -- some commands may take optional config options, see `:h neo-tree-mappings` for details
            config = {
              show_path = "none", -- "none", "relative", "absolute"
            },
          },
          ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add".
          ["d"] = "delete",
          ["r"] = "rename",
          ["y"] = "copy_to_clipboard",
          ["x"] = "cut_to_clipboard",
          ["p"] = "paste_from_clipboard",
          ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
          -- ["c"] = {
          --  "copy",
          --  config = {
          --    show_path = "none" -- "none", "relative", "absolute"
          --  }
          --}
          ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
          ["q"] = "close_window",
          ["R"] = "refresh",
          ["?"] = "show_help",
          ["<"] = "prev_source",
          [">"] = "next_source",
        },
      },
      nesting_rules = {},
      filesystem = {
        filtered_items = {
          visible = false, -- when true, they will just be displayed differently than normal items
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false, -- only works on Windows for hidden files/directories
          hide_by_name = {
            "node_modules",
          },
          hide_by_pattern = { -- uses glob style patterns
            ".git",
            --"*/src/*/tsconfig.json",
          },
          always_show = { -- remains visible even if other settings would normally hide it
            --".gitignored",
          },
          never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
            ".DS_Store",
            "thumbs.db",
          },
          never_show_by_pattern = { -- uses glob style patterns
            --".null-ls_*",
          },
        },
        follow_current_file = {
          enabled = true,          -- This will find and focus the file in the active buffer every time the current file is changed while the tree is open.
          leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
        group_empty_dirs = false,  -- when true, empty folders will be grouped together
        hijack_netrw_behavior = "open_current",
        --"open_default", -- netrw disabled, opening a directory opens neo-tree
        -- in whatever position is specified in window.position
        -- "open_current",  -- netrw disabled, opening a directory opens within the
        -- window like netrw would, regardless of window.position
        -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
        use_libuv_file_watcher = true, -- This will use the OS level file watchers to detect changes
        -- instead of relying on nvim autocmd events.
        window = {
          mappings = {
            ["<bs>"] = "navigate_up",
            ["."] = "set_root",
            ["H"] = "toggle_hidden",
            ["/"] = "fuzzy_finder",
            ["D"] = "fuzzy_finder_directory",
            ["#"] = "fuzzy_sorter",       -- fuzzy sorting using the fzy algorithm
            -- ["D"] = "fuzzy_sorter_directory",
            ["f"] = "filter_on_submit",
            ["<c-x>"] = "clear_filter",
            ["[g"] = "prev_git_modified",
            ["]g"] = "next_git_modified",
            ["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
            ["oc"] = { "order_by_created", nowait = false },
            ["od"] = { "order_by_diagnostics", nowait = false },
            ["og"] = { "order_by_git_status", nowait = false },
            ["om"] = { "order_by_modified", nowait = false },
            ["on"] = { "order_by_name", nowait = false },
            ["os"] = { "order_by_size", nowait = false },
            ["ot"] = { "order_by_type", nowait = false },
          },
          fuzzy_finder_mappings = {       -- define keymaps for filter popup window in fuzzy_finder_mode
            ["<down>"] = "move_cursor_down",
            ["<C-n>"] = "move_cursor_down",
            ["<up>"] = "move_cursor_up",
            ["<C-p>"] = "move_cursor_up",
          },
        },
        buffers = {
          follow_current_file = {
            enabled = true,        -- This will find and focus the file in the active buffer every time the current file is changed while the tree is open.
            leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
          },
          group_empty_dirs = true, -- when true, empty folders will be grouped together
          show_unloaded = true,
          window = {
            position = "left",
            mappings = {
              ["bd"] = "buffer_delete",
              ["<bs>"] = "navigate_up",
              ["."] = "set_root",
            },
          },
        },
        git_status = {
          window = {
            position = "left",
            mappings = {
              ["A"] = "git_add_all",
              ["gu"] = "git_unstage_file",
              ["ga"] = "git_add_file",
              ["gr"] = "git_revert_file",
              ["gc"] = "git_commit",
              ["gp"] = "git_push",
              ["gg"] = "git_commit_and_push",
            },
          },
        },
        event_handlers = {
          {
            event = "neo_tree_buffer_enter",
            handler = function(_)
              vim.opt_local.signcolumn = "auto"
            end,
          },
        },
      }
    }
  end,
}
