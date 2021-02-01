-- This colorscheme is the modified version of one made by glepnir.
-- Original source: http://github.com/glepnir/zephyr-nvim

local abstract = {
  base0      = '#1B2229';
  base1      = '#1c1f24';
  base2      = '#202328';
  base3      = '#23272e';
  base4      = '#3f444a';
  base5      = '#5B6268';
  base6      = '#73797e';
  base7      = '#9ca0a4';
  base8      = '#b1b1b1';

  bg = '#121212';
  bg1 = '#504945';
  bg_popup = '#232323';
  bg_highlight  = '#2E323C';
  bg_visual = '#b3deef';

  fg = '#bbc2cf';
  fg_alt  = '#5b6268';

  red = '#ff6c6b';
  magenta = '#d16d9e';
  orange = '#ff9940';
  yellow = '#ecbe7b';

  green = '#98be65';
  cyan = '#3bb6c4';
  blue = '#51afef';
  pink = '#ff99f1';
  teal = '#1abc9c';
  grey = '#928374';
  brown = '#666660';
  black = '#000000';

  bracket = '#80A0C2';
  currsor_bg = '#4f5b66';
  none = 'NONE';
}

function abstract.terminal_color()
  vim.g.terminal_color_0 = abstract.bg
  vim.g.terminal_color_1 = abstract.red
  vim.g.terminal_color_2 = abstract.green
  vim.g.terminal_color_3 = abstract.yellow
  vim.g.terminal_color_4 = abstract.blue
  vim.g.terminal_color_5 = abstract.pink
  vim.g.terminal_color_6 = abstract.cyan
  vim.g.terminal_color_7 = abstract.bg1
  vim.g.terminal_color_8 = abstract.brown
  vim.g.terminal_color_9 = abstract.red
  vim.g.terminal_color_10 = abstract.green
  vim.g.terminal_color_11 = abstract.yellow
  vim.g.terminal_color_12 = abstract.blue
  vim.g.terminal_color_13 = abstract.pink
  vim.g.terminal_color_14 = abstract.cyan
  vim.g.terminal_color_15 = abstract.fg
end

function abstract.highlight(group, color)
    local style = color.style and 'gui=' .. color.style or 'gui=NONE'
    local fg = color.fg and 'guifg=' .. color.fg or 'guifg=NONE'
    local bg = color.bg and 'guibg=' .. color.bg or 'guibg=NONE'
    local sp = color.sp and 'guisp=' .. color.sp or ''
    vim.api.nvim_command('highlight ' .. group .. ' ' .. style .. ' ' .. fg ..
                             ' ' .. bg..' '..sp)
end


function abstract.load_syntax()
  local syntax = {
    Normal = {fg = abstract.fg,bg=abstract.bg};
    Terminal = {fg = abstract.fg,bg=abstract.bg};
    SignColumn = {fg=abstract.fg,bg=abstract.bg};
    FoldColumn = {fg=abstract.fg_alt,bg=abstract.black};
    VertSplit = {fg=abstract.black,bg=abstract.bg};
    Folded = {fg=abstract.grey,bg=abstract.bg_highlight};
    EndOfBuffer = {fg=abstract.bg,bg=abstract.none};
    IncSearch = {fg=abstract.bg1,bg=abstract.orange,style=abstract.none};
    Search = {fg=abstract.bg,bg=abstract.green};
    ColorColumn = {fg=abstract.none,bg=abstract.none};
    Conceal = {fg=abstract.grey,bg=abstract.none};
    Cursor = {fg=abstract.none,bg=abstract.none,style='reverse'};
    vCursor = {fg=abstract.none,bg=abstract.none,style='reverse'};
    iCursor = {fg=abstract.none,bg=abstract.none,style='reverse'};
    lCursor = {fg=abstract.none,bg=abstract.none,style='reverse'};
    CursorIM = {fg=abstract.none,bg=abstract.none,style='reverse'};
    CursorColumn = {fg=abstract.none,bg=abstract.none};
    CursorLine = {fg=abstract.none,bg=abstract.none};
    LineNr = {fg=abstract.base4};
    CursorLineNr = {fg=abstract.blue};
    DiffAdd = {fg=abstract.black,bg=abstract.green};
    DiffChange = {fg=abstract.black,bg=abstract.yellow};
    DiffDelete = {fg=abstract.black,bg=abstract.red};
    DiffText = {fg=abstract.black,bg=abstract.fg};
    Directory = {fg=abstract.bg1,bg=abstract.none};
    ErrorMsg = {fg=abstract.red,bg=abstract.none,style='bold'};
    WarningMsg = {fg=abstract.yellow,bg=abstract.none,style='bold'};
    ModeMsg = {fg=abstract.fg,bg=abstract.none,style='bold'};
    MatchParen = {fg=abstract.red,bg=abstract.none};
    NonText = {fg=abstract.bg1};
    Whitespace = {fg=abstract.base4};
    SpecialKey = {fg=abstract.bg1};
    Pmenu = {fg=abstract.fg,bg=abstract.bg_popup};
    PmenuSel = {fg=abstract.base0,bg=abstract.blue};
    PmenuSelBold = {fg=abstract.base0,g=abstract.blue};
    PmenuSbar = {fg=abstract.none,bg=abstract.blue};
    PmenuThumb = {fg=abstract.brown,bg=abstract.brown};
    WildMenu = {fg=abstract.fg,bg=abstract.green};
    Question = {fg=abstract.yellow};
    NormalFloat = {fg=abstract.base8,bg=abstract.bg_highlight};
    TabLineFill = {style=abstract.none};
    TabLineSel = {bg=abstract.blue};
    StatusLine = {fg=abstract.base8,bg=abstract.base2,style=abstract.none};
    StatusLineNC = {fg=abstract.grey,bg=abstract.base2,style=abstract.none};
    SpellBad = {fg=abstract.red,bg=abstract.none,style='undercurl'};
    SpellCap = {fg=abstract.blue,bg=abstract.none,style='undercurl'};
    SpellLocal = {fg=abstract.cyan,bg=abstract.none,style='undercurl'};
    SpellRare = {fg=abstract.pink,bg=abstract.none,style = 'undercurl'};
    Visual = {fg=abstract.black,bg=abstract.bg_visual};
    VisualNOS = {fg=abstract.black,bg=abstract.bg_visual};
    QuickFixLine = {fg=abstract.pink,style='bold'};
    Debug = {fg=abstract.orange};
    debugBreakpoint = {fg=abstract.bg,bg=abstract.red};

    Boolean = {fg=abstract.orange};
    Number = {fg=abstract.pink};
    Float = {fg=abstract.pink};
    PreProc = {fg=abstract.pink};
    PreCondit = {fg=abstract.pink};
    Include = {fg=abstract.pink};
    Define = {fg=abstract.pink};
    Conditional = {fg=abstract.pink};
    Repeat = {fg=abstract.pink};
    Keyword = {fg=abstract.red};
    Typedef = {fg=abstract.red};
    Exception = {fg=abstract.red};
    Statement = {fg=abstract.red};
    Error = {fg=abstract.red};
    StorageClass = {fg=abstract.orange};
    Tag = {fg=abstract.orange};
    Label = {fg=abstract.orange};
    Structure = {fg=abstract.orange};
    Operator = {fg=abstract.magenta};
    Title = {fg=abstract.orange,style='bold'};
    Special = {fg=abstract.yellow};
    SpecialChar = {fg=abstract.yellow};
    Type = {fg=abstract.yellow};
    Function = {fg=abstract.magenta,style='bold'};
    String = {fg=abstract.green};
    Character = {fg=abstract.green};
    Constant = {fg=abstract.cyan};
    Macro = {fg=abstract.cyan};
    Identifier = {fg=abstract.blue};

    Comment = {fg=abstract.base6};
    SpecialComment = {fg=abstract.grey};
    Todo = {fg=abstract.pink};
    Delimiter = {fg=abstract.fg};
    Ignore = {fg=abstract.grey};
    Underlined = {fg=abstract.none,style='underline'};

    TSFunction = {fg=abstract.yellow,style='bold'};
    TSMethod = {fg=abstract.yellow,style='bold'};
    TSKeywordFunction = {fg=abstract.blue};
    TSProperty = {fg=abstract.cyan};
    TSType = {fg=abstract.teal};
    TSPunctBracket = {fg=abstract.bracket};

    vimCommentTitle = {fg=abstract.grey,style='bold'};
    vimLet = {fg=abstract.orange};
    vimVar = {fg=abstract.cyan};
    vimFunction = {fg=abstract.magenta,style='bold'};
    vimIsCommand = {fg=abstract.fg};
    vimCommand = {fg=abstract.blue};
    vimNotFunc = {fg=abstract.pink,style='bold'};
    vimUserFunc = {fg=abstract.yellow,style='bold'};
    vimFuncName= {fg=abstract.yellow,style='bold'};

    diffAdded = {fg = abstract.green};
    diffRemoved = {fg =abstract.red};
    diffChanged = {fg = abstract.blue};
    diffOldFile = {fg = abstract.yellow};
    diffNewFile = {fg = abstract.orange};
    diffFile    = {fg = abstract.aqua};
    diffLine    = {fg = abstract.grey};
    diffIndexLine = {fg = abstract.pink};

    gitcommitSummary = {fg = abstract.red};
    gitcommitUntracked = {fg = abstract.grey};
    gitcommitDiscarded = {fg = abstract.grey};
    gitcommitSelected = { fg=abstract.grey};
    gitcommitUnmerged = { fg=abstract.grey};
    gitcommitOnBranch = { fg=abstract.grey};
    gitcommitArrow  = {fg = abstract.grey};
    gitcommitFile  = {fg = abstract.green};

    VistaBracket = {fg=abstract.grey};
    VistaChildrenNr = {fg=abstract.orange};
    VistaKind = {fg=abstract.purpl};
    VistaScope = {fg=abstract.red};
    VistaScopeKind = {fg=abstract.blue};
    VistaTag = {fg=abstract.green,style='bold'};
    VistaPrefix = {fg=abstract.grey};
    VistaColon = {fg=abstract.green};
    VistaIcon = {fg=abstract.yellow};
    VistaLineNr = {fg=abstract.fg};

    GitGutterAdd = {fg=abstract.green};
    GitGutterChange = {fg=abstract.blue};
    GitGutterDelete = {fg=abstract.red};
    GitGutterChangeDelete = {fg=abstract.pink};

    SignifySignAdd = {fg=abstract.green};
    SignifySignChange = {fg=abstract.blue};
    SignifySignDelete = {fg=abstract.red};

    dbui_tables = {fg=abstract.blue};

    DefxIconsParentDirectory = {fg=abstract.orange};
    Defx_filename_directory = {fg=abstract.blue};
    Defx_filename_root = {fg=abstract.red};

    DashboardShortCut = {fg=abstract.pink};
    DashboardHeader = {fg=abstract.orange};
    DashboardCenter = {fg=abstract.blue};
    DashboardFooter = {fg=abstract.grey};

    LspDiagnosticsSignError = {fg=abstract.red};
    LspDiagnosticsSignWarning = {fg=abstract.yellow};
    LspDiagnosticsSignInformation = {fg=abstract.blue};
    LspDiagnosticsSignHint = {fg=abstract.cyan};

    LspDiagnosticsVirtualTextError = {fg=abstract.red};
    LspDiagnosticsVirtualTextWarning= {fg=abstract.yellow};
    LspDiagnosticsVirtualTextInformation = {fg=abstract.blue};
    LspDiagnosticsVirtualTextHint = {fg=abstract.cyan};

    LspDiagnosticsUnderlineError = {style="undercurl",sp=abstract.red};
    LspDiagnosticsUnderlineWarning = {style="undercurl",sp=abstract.yellow};
    LspDiagnosticsUnderlineInformation = {style="undercurl",sp=abstract.blue};
    LspDiagnosticsUnderlineHint = {style="undercurl",sp=abstract.cyan};

    CursorWord0 = {bg=abstract.currsor_bg};
    CursorWord1 = {bg=abstract.currsor_bg};

    NvimTreeFolderName = {fg=abstract.blue};
    NvimTreeRootFolder = {fg=abstract.red};
    NvimTreeSpecialFile = {fg=abstract.fg,bg=abstract.none,stryle='NONE'};

    TelescopeBorder = {fg=abstract.teal};
    TelescopePromptBorder = {fg=abstract.blue}
  }
  return syntax
end

function abstract.get_abstract_color()
  return abstract
end

function abstract.colorscheme()
  vim.api.nvim_command('hi clear')
  if vim.fn.exists('syntax_on') then
    vim.api.nvim_command('syntax reset')
  end

  abstract.terminal_color()
  local syntax = abstract.load_syntax()

  for group,colors in pairs(syntax) do
    abstract.highlight(group,colors)
  end
end

abstract.colorscheme()

return abstract
