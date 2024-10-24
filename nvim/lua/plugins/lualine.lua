return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
  opts = function()
    local utils = require("general.utils")

    local hide_in_width = function()
      return vim.fn.winwidth(0) > 80
    end

    local diagnostics = {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      sections = { "error", "warn" },
      diagnostics_color = {
        error = "DiagnosticError",
        warm = "DiagnosticWarn",
      },
      symbols = { error = utils.get_icon("DiagnosticError"), warn = utils.get_icon("DiagnosticWarn") },
      colored = true,
      update_in_insert = false,
      always_visible = false,
    }

    local diff = {
      "diff",
      diff_color = {
        added = "DiffAdd",
        modified = "DiffChange",
        removed = "DiffDelete",
      },
      symbols = {
        added = utils.get_icon("GitAddReversed"),
        modified = utils.get_icon("GitModifiedReversed"),
        removed = utils.get_icon("GitDeleteReversed"),
      }, -- changes diff symbols
      colored = false,
      always_visible = false,
      cond = hide_in_width,
    }

    local fileformat = {
      "fileformat",
      symbols = {
        unix = utils.get_icon("OSUnix"), -- e712
        dos = utils.get_icon("OSWin"), -- e70f
        mac = utils.get_icon("OSMac"), -- e711
      },
    }

    local filename = {
      "filename",
      file_status = false,   -- Displays file status (readonly status, modified status)
      newfile_status = false, -- Display new file status (new file means no write after created)
      path = 3,              -- 0: Just the filename
      -- 1: Relative path
      -- 2: Absolute path
      -- 3: Absolute path, with tilde as the home directory

      shorting_target = 40, -- Shortens path to leave 40 spaces in the window
      -- for other components. (terrible name, any suggestions?)
      symbols = {
        modified = "[+]",    -- Text to show when the file is modified.
        readonly = "[-]",    -- Text to show when the file is non-modifiable or readonly.
        unnamed = "[No Name]", -- Text to show for unnamed buffers.
        newfile = "[New]",   -- Text to show for new created file before first writting
      },
    }

    local filetype = {
      "filetype",
      colored = true,
      icon_only = true,
      icon = { align = "right" }, -- Display filetype icon on the right hand side
      icons_enabled = false,
      -- icon =    {'X', align='right'}
      -- Icon string ^ in table is ignored in filetype component
    }

    local mode = {
      "mode",
      fmt = function(str)
        return " " .. str .. " "
      end,
    }

    local branch = {
      "branch",
      icons_enabled = true,
      icon = "",
    }

    local location = {
      "location",
      padding = 1,
    }

    local encoding = {
      "encoding",
    }

    local date = "os.date('%a, %d %b %Y %H:%M:%S')"

    local lsp = {
      function()
        local msg = "No Active Lsp"
        local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
          return msg
        end
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
          end
        end
        return msg
      end,
      icon = utils.get_icon("LSPServer") .. " LSP:",
      --color = { fg = '#ffffff', gui = 'bold' },
    }

    return {
      options = {
        icons_enabled = true,
        --theme = "auto",
        -- theme = "onedark",
        theme = "palenight",
        --component_separators = { left = "", right = "" },
        --section_separators = { left = "", right = "" },
        component_separators = {
          left = utils.get_icon("LualineComponentSeparatorLeft"),
          right = utils.get_icon("LualineComponentSeparatorRight"),
        },
        section_separators = {
          left = utils.get_icon("LualineSectionSeparatorLeft"),
          right = utils.get_icon("LualineSectionSeparatorRight"),
        },
        disabled_filetypes = { "alpha", "neo-tree", "aerial", "help" },
        always_divide_middle = true,
        padding = { left = 2, right = 2 },
      },
      globalstatus = true,
      sections = {
        lualine_a = { mode },
        lualine_b = { branch, diff },
        lualine_c = { filename },
        lualine_x = { diagnostics, lsp },
        lualine_y = { encoding, fileformat, filetype },
        lualine_z = { location },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { filename },
        lualine_x = { location },
        lualine_y = {},
        lualine_z = {},
      },
      extensions = {},
    }
  end,
}
--  terminal = {
--    a = { fg = colors.black, bg = colors.yellow, gui = 'bold' },
--    b = { fg = colors.yellow, bg = colors.menu_grey },
--  },
--  command = {
--    a = { fg = colors.black, bg = colors.dark_yellow, gui = 'bold' },
--    b = { fg = colors.dark_yellow, bg = colors.menu_grey },
--  },
