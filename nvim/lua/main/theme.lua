local utils = require("main.general.utils")
local palette = require("main.general.palette")

local theme = {}

theme.base = {
  Normal = { fg = palette.blue_normal, bg = palette.bg },
  NormalFloat = { fg = palette.blue, bg = palette.bg },
  Comment = { fg = palette.purple_comment, bg = palette.none, italic = true },
  Constant = { fg = palette.yellow_1, bg = palette.none },
  String = { fg = palette.green, bg = palette.none },
  Character = { fg = palette.green, bg = palette.none },
  Number = { fg = palette.orange_1, bg = palette.none },
  Boolean = { fg = palette.red, bg = palette.none },
  Float = { fg = palette.orange_1, bg = palette.none },
  Identifier = { fg = palette.blue, bg = palette.none },
  Function = { fg = palette.purple_statement, bg = palette.none, bold = true, italic = true },
  Statement = { fg = palette.pink, bg = palette.none, italic = true },
  Conditional = { fg = palette.pink, bg = palette.none, italic = true },
  Repeat = { fg = palette.pink, bg = palette.none, italic = true },
  Label = { fg = palette.blue, bg = palette.none },
  Operator = { fg = palette.pink, bg = palette.none },
  Keyword = { fg = palette.pink, bg = palette.none, italic = true },
  Exception = { fg = palette.pink, bg = palette.none },
  Preproc = { fg = palette.yellow, bg = palette.none },
  Include = { fg = palette.pink, bg = palette.none },
  Define = { fg = palette.pink, bg = palette.none },
  Title = { fg = palette.cyan, bg = palette.none },
  Macro = { fg = palette.pink, bg = palette.none },
  PreCondit = { fg = palette.blue, bg = palette.none },
  Type = { fg = palette.yellow, bg = palette.none },
  StorageClass = { fg = palette.blue, bg = palette.none },
  Structure = { fg = palette.yellow, bg = palette.none },
  Typedef = { fg = palette.yellow, bg = palette.none },
  Special = { fg = palette.blue, bg = palette.none },
  SpecialComment = { fg = palette.grey, bg = palette.none },
  Error = { fg = palette.red, bg = palette.none },
  Todo = { fg = palette.pink, bg = palette.none },
  Underlined = { fg = palette.cyan, bg = palette.none },
  Cursor = { fg = palette.bg, bg = palette.fg },
  ColorColumn = { fg = palette.none, bg = palette.grey_4 },
  CursorLineNr = { fg = palette.yellow_cursorline, bg = palette.none, bold = true },
  Conceal = { fg = palette.grey, bg = palette.none },
  CursorColumn = { fg = palette.none, bg = palette.bg_highlight_1 },
  CursorLine = { fg = palette.none, bg = palette.bg_highlight_1 },
  Directory = { fg = palette.blue, bg = palette.none },
  DiffAdd = { fg = palette.grey_3, bg = palette.green },
  DiffChange = { fg = palette.yellow, bg = palette.none },
  DiffDelete = { fg = palette.grey_3, bg = palette.red },
  DiffText = { fg = palette.grey_3, bg = palette.yellow },
  ErrorMsg = { fg = palette.red, bg = palette.none },
  VertSplit = { fg = palette.grey_4, bg = palette.none },
  Folded = { fg = palette.grey, bg = palette.none },
  FoldColumn = { fg = palette.none, bg = palette.none },
  IncSearch = { fg = palette.yellow, bg = palette.grey },
  LineNr = { fg = palette.grey_1, bg = palette.none },
  NonText = { fg = palette.grey_1, bg = palette.none },
  Pmenu = { fg = palette.fg, bg = palette.black_1 },
  PmenuSel = { fg = palette.none, bg = palette.grey_4 },
  PmenuSbar = { fg = palette.none, bg = palette.grey_3 },
  PmenuThumb = { fg = palette.none, bg = palette.fg },
  Question = { fg = palette.pink, bg = palette.none },
  QuickFixLine = { fg = palette.grey_3, bg = palette.yellow },
  Search = { fg = palette.grey_3, bg = palette.yellow },
  SignColumn = { fg = palette.bg, bg = palette.bg },
  SpecialKey = { fg = palette.grey_1, bg = palette.none },
  SpellBad = { fg = palette.red, bg = palette.none },
  SpellCap = { fg = palette.yellow, bg = palette.none },
  SpellLocal = { fg = palette.yellow, bg = palette.none },
  SpellRare = { fg = palette.yellow, bg = palette.none },
  StatusLine = { fg = palette.fg, bg = palette.bg },
  StatusLineNC = { fg = palette.grey, bg = palette.none },
  StatusLineTerm = { fg = palette.fg, bg = palette.bg },
  StatusLineTermNC = { fg = palette.grey_4, bg = palette.none },
  TabLine = { fg = palette.grey, bg = palette.none },
  TabLineSel = { fg = palette.fg, bg = palette.none },
  TabLineFill = { fg = palette.none, bg = palette.grey_3 },
  Terminal = { fg = palette.fg, bg = palette.grey_3 },
  Visual = { fg = palette.none, bg = palette.grey_5 },
  VisualNOS = { fg = palette.grey_5, bg = palette.none },
  WarningMsg = { fg = palette.yellow, bg = palette.none },
  WildMenu = { fg = palette.grey_3, bg = palette.blue },
  EndOfBuffer = { fg = palette.bg, bg = palette.none },
  FloatBorder = { fg = palette.blue_normal, bg = palette.none },
  MatchParen = { fg = palette.none, bg = palette.grey_5 },
  Unlisted = { fg = palette.unlisted, bg = palette.none, bold = true, italic = true },
}

theme.aerial = {
  AerialLine = { fg = palette.black_1, bg = palette.purple_highlight },
}

theme.bufferline = {
  BufferLineFill = { fg = palette.bg_1, bg = palette.bg_1 },
  BufferLineBackground = { fg = palette.fg, bg = palette.bg_1 },      -- buffer that not shown in window
  BufferLineBuffer = { fg = palette.fg, bg = palette.bg_1 },          -- buffer that are visible
  BufferLineBufferVisible = { fg = palette.fg_1, bg = palette.bg_1 }, -- buffer that are visible
  BufferLineBufferSelected = { fg = palette.purple_statement, bg = palette.bg, bold = true, italic = true },
  BufferLineTab = { fg = palette.fg, bg = palette.bg_1 },
  BufferLineIndicatorSelected = { fg = palette.blue_normal, bg = palette.bg, bold = true },
  BufferLineIndicatorVisible = { fg = palette.bg_1, bg = palette.bg_1 },
  BufferLineSeparator = { fg = palette.bg, bg = palette.bg, bold = true },
  BufferLineCloseButton = { fg = palette.grey_8, bg = palette.bg_1 },
  BufferLineCloseButtonVisible = { fg = palette.grey_4, bg = palette.bg_1 },
  BufferLineCloseButtonSelected = { fg = palette.grey_10, bg = palette.bg },
  BufferLineModified = { fg = palette.fg, bg = palette.bg_1 },
  BufferLineModifiedVisible = { fg = palette.green, bg = palette.bg_1 },
  BufferLineModifiedSelected = { fg = palette.green, bg = palette.bg, bold = true, italic = true },
  BufferLineError = { fg = palette.red_1, bg = palette.bg_1 },
  BufferLineErrorVisible = { fg = palette.red_1, bg = palette.bg_1 },
  BufferLineErrorSelected = { fg = palette.red_1, bg = palette.bg, bold = true, italic = true },
  BufferLineErrorDiagnostic = { fg = palette.red_1, bg = palette.bg_1 },
  BufferLineErrorDiagnosticVisible = { fg = palette.red_1, bg = palette.bg_1 },
  BufferLineErrorDiagnosticSelected = { fg = palette.red_1, bg = palette.bg, bold = true, italic = true },
  BufferLineWarning = { fg = palette.yellow_diag, bg = palette.bg_1 },
  BufferLineWarningVisible = { fg = palette.yellow_diag, bg = palette.bg_1 },
  BufferLineWarningSelected = { fg = palette.yellow_diag, bg = palette.bg, bold = true, italic = true },
  BufferLineWarningDiagnostic = { fg = palette.yellow_diag, bg = palette.bg_1 },
  BufferLineWarningDiagnosticVisible = { fg = palette.yellow_diag, bg = palette.bg_1 },
  BufferLineWarningDiagnosticSelected = { fg = palette.yellow_diag, bg = palette.bg, bold = true, italic = true },
  BufferLineHint = { fg = palette.fg, bg = palette.bg_1 },
  BufferLineHintVisible = { fg = palette.fg_1, bg = palette.bg_1 },
  BufferLineHintSelected = { fg = palette.white_hint, bg = palette.bg, bold = true, italic = true },
  BufferLineHintDiagnostic = { fg = palette.fg, bg = palette.bg_1 },
  BufferLineHintDiagnosticVisible = { fg = palette.fg_1, bg = palette.bg_1 },
  BufferLineHintDiagnosticSelected = { fg = palette.white_hint, bg = palette.bg, bold = true, italic = true },
}

theme.illuminate = {
  IlluminatedWordText = { bg = palette.bg_highlight_2 },
  IlluminatedWordRead = { bg = palette.bg_highlight_2 },
  IlluminatedWordWrite = { bg = palette.bg_highlight_2 },
}

theme.indentblankline = {
  IndentBlankLine = { fg = palette.purple_comment, bg = palette.none },
}

theme.lazy = {
  LazyNormal = { fg = palette.blue_normal, bg = palette.bg },
}

-- theme.lsp = {
--   LspReferenceText = { bg = palette.bg_highlight_2 },
--   LspReferenceRead = { bg = palette.bg_highlight_2 },
--   LspReferenceWrite = { bg = palette.bg_highlight_2 },
-- }

-- theme.lualine = {
--   lualine_a_normal = { fg = palette.bg, bg = palette.pink },
--   lualine_transitional_lualine_a_normal_to_lualine_b_normal = { fg = palette.pink, bg = palette.fg },
--   lualine_b_normal = { fg = palette.fg, bg = palette.pink },
--   lualine_transitional_lualine_b_normal_to_lualine_c_normal = { fg = palette.fg, bg = palette.bg },
--   lualine_c_normal = { fg = palette.fg, bg = palette.bg },
-- }

theme.mason = {
  MasonNormal = { fg = palette.blue_normal, bg = palette.bg },
}

theme.neotree = {
  NeoTreeTabActive = { fg = palette.purple_statement, bg = palette.bg, bold = true, italic = true },
  NeoTreeTabInactive = { fg = palette.bg_highlight_2, bg = palette.bg_1 },
  NeoTreeTabSeparatorActive = { fg = palette.blue_normal, bg = palette.bg, bold = true },
  NeoTreeTabSeparatorInactive = { fg = palette.bg_highlight_2, bg = palette.bg_1 },
  NeoTreeWinSeparator = { fg = palette.blue_normal },
}

for _, entry in pairs(theme) do
  utils.set_theme(entry)
end
