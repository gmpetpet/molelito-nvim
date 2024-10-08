--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require('lush')
local hsl = lush.hsl

-- Colors taken from the default Tailwind color palette:
-- https://tailwindcss.com/docs/customizing-colors#default-color-palette
local slate = {
    [50] = hsl("#f8fafc"),
    [100] = hsl("#f1f5f9"),
    [300] = hsl("#cbd5e1"),
    [400] = hsl("#94a3b8"),
    [500] = hsl("#64748b"),
    [600] = hsl("#475569"),
    [700] = hsl("#334155"),
    [800] = hsl("#1e293b"),
    [900] = hsl("#0f172a"),
    [950] = hsl("#020617"),
}

local pink = {
    [200] = hsl("#fbcfe8"),
    [300] = hsl("#f9a8d4"),
    [400] = hsl("#f472b6"),
}

local sky = {
    [200] = hsl("#bae6fd"),
    [300] = hsl("#7dd3fc"),
    [500] = hsl("#0ea5e9"),
    [900] = hsl("#0c4a6e"),
    [950] = hsl("#082f49"),
}

local green = {
    [200] = hsl("#bbf7d0"),
}

slate[850] = slate[900].desaturate(20)
slate[840] = slate[850].lighten(3)
slate[860] = slate[850].darken(9)

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
    local sym = injected_functions.sym
    return {
        -- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
        -- groups, mostly used for styling UI elements.
        -- Comment them out and add your own properties to override the defaults.
        -- An empty definition `{}` will clear all styling, leaving elements looking
        -- like the 'Normal' group.
        -- To be able to link to a group, it must already be defined, so you may have
        -- to reorder items as you go.
        --
        -- See :h highlight-groups
        --
        -- ColorColumn    { bg = "#ff0000", fg = "#ff0000" }, -- Columns set with 'colorcolumn'
        Conceal        { fg = slate[100], bg = slate[700] }, -- Placeholder characters substituted for concealed text (see 'conceallevel') 
        Cursor         { fg = slate[850], bg = sky[300] }, -- Character under the cursor
        CurSearch      { bg = sky[500] }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
        -- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
        -- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
        -- CursorColumn   { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
        CursorLine     { bg = slate[860] }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
        Directory      { fg = sky[300] }, -- Directory names (and other special names in listings)
        DiffAdd        { fg = green[200], bg = slate[850] }, -- Diff mode: Added line |diff.txt|
        DiffChange     { fg = sky[300], bg = slate[850] }, -- Diff mode: Changed line |diff.txt|
        DiffDelete     { fg = pink[400], bg = slate[850] }, -- Diff mode: Deleted line |diff.txt|
        DiffText       { Conceal }, -- Diff mode: Changed text within a changed line |diff.txt|
        EndOfBuffer    { fg = slate[850] }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
        -- TermCursor     { }, -- Cursor in a focused terminal
        -- TermCursorNC   { }, -- Cursor in an unfocused terminal
        ErrorMsg       { bg = slate[850], fg = pink[400] }, -- Error messages on the command line
        VertSplit      { fg = slate[850] }, -- Column separating vertically split windows
        Folded         { fg = sky[300], bg = slate[850] }, -- Line used for closed folds
        FoldColumn     { fg = sky[300], bg = slate[850] }, -- 'foldcolumn'
        SignColumn     { bg = slate[850] } , -- Column where |signs| are displayed
        IncSearch      { fg = slate[850], bg = sky[300] }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
        -- Substitute     { }, -- |:substitute| replacement text highlighting
        LineNr         { fg = slate[700] }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
        -- LineNrAbove    { }, -- Line number for when the 'relativenumber' option is set, above the cursor line
        -- LineNrBelow    { }, -- Line number for when the 'relativenumber' option is set, below the cursor line
        CursorLineNr   { fg = slate[500] }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
        -- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
        -- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
        MatchParen     { fg = slate[100], bg = slate[600] }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
        -- ModeMsg        { }, -- 'showmode' message (e.g., "-- INSERT -- ")
        -- MsgArea        { }, -- Area for messages and cmdline
        -- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
        MoreMsg        { fg = green[200] }, -- |more-prompt|
        -- NonText        { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
        Normal         { fg = slate[50], bg = slate[850] }, -- Normal text
        NormalFloat    { bg = slate[840] }, -- Normal text in floating windows.
        FloatBorder    { bg = slate[860] }, -- Border of floating windows.
        -- FloatTitle     { }, -- Title of floating windows.
        -- NormalNC       { }, -- normal text in non-current windows
        Pmenu          { bg = slate[840] }, -- Popup menu: Normal item.
        PmenuSel       { fg = slate[840], bg = sky[300] }, -- Popup menu: Selected item.
        -- PmenuKind      { }, -- Popup menu: Normal item "kind"
        -- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
        -- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
        -- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
        PmenuSbar      { bg = slate[840] }, -- Popup menu: Scrollbar.
        PmenuThumb     { bg = slate[700] }, -- Popup menu: Thumb of the scrollbar.
        Question       { fg = green[200] }, -- |hit-enter| prompt and yes/no questions
        -- QuickFixLine   { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
        Search         { fg = slate[850], bg = sky[300] }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
        -- SpecialKey     { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
        -- SpellBad       { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
        -- SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
        -- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
        -- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
        -- StatusLine     { }, -- Status line of current window
        -- StatusLineNC   { }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
        -- TabLine        { }, -- Tab pages line, not active tab page label
        -- TabLineFill    { }, -- Tab pages line, where there are no labels
        -- TabLineSel     { }, -- Tab pages line, active tab page label
        Title          { fg = pink[400] }, -- Titles for output from ":set all", ":autocmd" etc.
        Visual         { fg = slate[300], bg = slate[700] }, -- Visual mode selection
        -- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
        -- WarningMsg     { }, -- Warning messages
        -- Whitespace     { }, -- "n6sp", "space", "tab" and "trail" in 'listchars'
        Winseparator   { fg = slate[850] }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
        -- WildMenu       { }, -- Current match in 'wildmenu' completion
        -- WinBar         { }, -- Window bar of current window
        -- WinBarNC       { }, -- Window bar of not-current windows

        -- Common vim syntax groups used for all kinds of code and markup.
        -- Commented-out groups should chain up to their preferred (*) group
        -- by default.
        --
        -- See :h group-name
        --
        -- Uncomment and edit if you want more specific syntax highlighting.

        Comment        { fg = slate[700] }, -- Any comment

        Constant       { fg = slate[50] }, -- (*) Any constant
        String         { fg = sky[300] }, --   A string constant: "this is a string"
        -- Character      { }, --   A character constant: 'c', '\n'
        -- Number         { }, --   A number constant: 234, 0xff
        -- Boolean        { }, --   A boolean constant: TRUE, false
        -- Float          { }, --   A floating point constant: 2.3e10

        Identifier     { fg = slate[50] }, -- (*) Any variable name
        Function       { fg = slate[50] }, --{ fg = pink[400] }, --   Function name (also: methods for classes)

        Statement      { fg = slate[500] }, -- (*) Any statement
        -- Conditional    { }, --   if, then, else, endif, switch, etc.
        -- Repeat         { }, --   for, do, while, etc.
        -- Label          { }, --   case, default, etc.
        -- Operator       { }, --   "sizeof", "+", "*", etc.
        -- Keyword        { }, --   any other keyword
        -- Exception      { }, --   try, catch, throw

        PreProc        { fg = slate[500] }, -- (*) Generic Preprocessor
        -- Include        { }, --   Preprocessor #include
        -- Define         { }, --   Preprocessor #define
        -- Macro          { }, --   Same as Define
        -- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

        Type           { fg = slate[50] }, -- (*) int, long, char, etc.
        -- StorageClass   { }, --   static, register, volatile, etc.
        -- Structure      { }, --   struct, union, enum, etc.
        -- Typedef        { }, --   A typedef

        Special        { fg = slate[500] }, -- (*) Any special symbol
        -- SpecialChar    { }, --   Special character in a constant
        -- Tag            { }, --   You can use CTRL-] on this
        -- Delimiter      { }, --   Character that needs attention
        SpecialComment { fg = slate[600] }, --   Special things inside a comment (e.g. '\n')
        -- Debug          { }, --   Debugging statements

        -- Underlined     { gui = "underline" }, -- Text that stands out, HTML links
        -- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
        -- Error          { }, -- Any erroneous construct
        -- Todo           { }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

        -- These groups are for the native LSP client and diagnostic system. Some
        -- other LSP clients may use these groups, or use their own. Consult your
        -- LSP client's documentation.

        -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
        --
        -- LspReferenceText            { } , -- Used for highlighting "text" references
        -- LspReferenceRead            { } , -- Used for highlighting "read" references
        -- LspReferenceWrite           { } , -- Used for highlighting "write" references
        -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
        -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
        -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

        -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
        --
        DiagnosticError            { ErrorMsg } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        -- DiagnosticWarn             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        DiagnosticInfo             { String } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        DiagnosticHint             { Special } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        DiagnosticOk               { Question } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
        -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
        -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
        -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
        -- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
        DiagnosticUnderlineError   { gui = "nocombine" } , -- Used to underline "Error" diagnostics.
        DiagnosticUnderlineWarn    { gui = "nocombine" } , -- Used to underline "Warn" diagnostics.
        DiagnosticUnderlineInfo    { gui = "nocombine" } , -- Used to underline "Info" diagnostics.
        DiagnosticUnderlineHint    { gui = "nocombine" } , -- Used to underline "Hint" diagnostics.
        DiagnosticUnderlineOk      { gui = "nocombine" } , -- Used to underline "Ok" diagnostics.
        -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
        -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
        -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
        -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
        -- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
        -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
        -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
        -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
        -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
        -- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

        -- Tree-Sitter syntax groups.
        --
        -- See :h treesitter-highlight-groups, some groups may not be listed,
        -- submit a PR fix to lush-template!
        --
        -- Tree-Sitter groups are defined with an "@" symbol, which must be
        -- specially handled to be valid lua code, we do this via the special
        -- sym function. The following are all valid ways to call the sym function,
        -- for more details see https://www.lua.org/pil/5.html
        --
        -- sym("@text.literal")
        -- sym('@text.literal')
        -- sym"@text.literal"
        -- sym'@text.literal'
        --
        -- For more information see https://github.com/rktjmp/lush.nvim/issues/109

        -- sym"@text.literal"      { }, -- Comment
        sym"@text.literal.block.vimdoc"      { CursorLineNr }, -- Vimdoc
        sym"@text.literal.vimdoc"     { String }, -- Vimdoc
        -- sym"@text.reference"    { }, -- Identifier
        -- sym"@text.title"        { }, -- Title
        -- sym"@text.uri"          { }, -- Underlined
        -- sym"@text.underline"    { }, -- Underlined
        -- sym"@text.todo"         { }, -- Todo
        -- sym"@comment"           { }, -- Comment
        -- sym"@punctuation"       { }, -- Delimiter
        -- sym"@constant"          { }, -- Constant
        -- sym"@constant.builtin"  { }, -- Special
        -- sym"@constant.macro"    { }, -- Define
        -- sym"@define"            { }, -- Define
        -- sym"@macro"             { }, -- Macro
        -- sym"@string"            { }, -- String
        -- sym"@string.escape"     { }, -- SpecialChar
        -- sym"@string.special"    { }, -- SpecialChar
        -- sym"@character"         { }, -- Character
        -- sym"@character.special" { }, -- SpecialChar
        -- sym"@number"            { }, -- Number
        -- sym"@boolean"           { }, -- Boolean
        -- sym"@float"             { }, -- Float
        sym"@function"          { fg = pink[300] }, -- Function
        sym"@function.builtin"  { Identifier }, -- Special
        -- sym"@function.macro"    { }, -- Macro
        -- sym"@parameter"         { }, -- Identifier
        -- sym"@method"            { }, -- Function
        -- sym"@field"             { }, -- Identifier
        -- sym"@property"          { }, -- Identifier
        sym"@constructor"       { Identifier }, -- Special
        -- sym"@conditional"       { }, -- Conditional
        -- sym"@repeat"            { }, -- Repeat
        -- sym"@label"             { }, -- Label
        -- sym"@operator"          { }, -- Operator
        -- sym"@keyword"           { }, -- Keyword
        -- sym"@exception"         { }, -- Exception
        -- sym"@variable"          { }, -- Identifier
        -- sym"@type"              { }, -- Type
        -- sym"@type.definition"   { }, -- Typedef
        -- sym"@storageclass"      { }, -- StorageClass
        -- sym"@structure"         { }, -- Structure
        -- sym"@namespace"         { }, -- Identifier
        -- sym"@include"           { }, -- Include
        -- sym"@preproc"           { }, -- PreProc
        -- sym"@debug"             { }, -- Debug
        -- sym"@tag"               { }, -- Tag

        sym"@type.qualifier"    { Statement },
        sym"@keyword.sql"       { Function },

        -- Telescope highlight groups.
        -- TelescopeNormal         { }
        -- TelescopeBorder         { }
        -- TelescopePromptPrefix   { }
        TelescopeMatching       { fg = sky[300] },
        TelescopeSelection      { bg = slate[840] },
        TelescopeSelectionCaret { fg = sky[300], bg = slate[840] },

        TelescopePromptNormal   { fg = slate[50], bg = slate[860] },
        TelescopePromptBorder   { fg = slate[860], bg = slate[860] },
        TelescopePromptTitle    { fg = slate[860], bg = slate[860] },
        TelescopePromptCounter  { fg = slate[700] },

        TelescopePreviewNormal  { fg = slate[50], bg = slate[840] },
        TelescopePreviewBorder  { fg = slate[840], bg = slate[840] },
        TelescopePreviewTitle   { fg = slate[840], bg = pink[400] },

        TelescopeResultsNormal  { fg = slate[50], bg = slate[860] },
        TelescopeResultsBorder  { fg = slate[860], bg = slate[860] },
        TelescopeResultsTitle   { fg = slate[860], bg = sky[300] },

        -- Alpha
        AlphaStartLogo1         { fg = sky[200].darken(53) },
        AlphaStartLogo2         { fg = sky[200].darken(50) },
        AlphaStartLogo3         { fg = sky[200].darken(47) },
        AlphaStartLogo4         { fg = sky[200].darken(44) },
        AlphaStartLogo5         { fg = sky[200].darken(41) },
        AlphaStartLogo6         { fg = sky[200].darken(38) },
        AlphaStartLogo7         { fg = sky[200].darken(35) },
        AlphaStartLogo8         { fg = sky[200].darken(32) },
        AlphaStartLogo9         { fg = sky[200].darken(29) },
        AlphaStartLogo10        { fg = sky[200].darken(26) },
        AlphaStartLogo11        { fg = sky[200].darken(23) },
        AlphaStartLogo12        { fg = sky[200].darken(20) },

        -- NvimTree
        NvimTreeIndentMarker    { Comment },
        NvimTreeRootFolder      { Special },
        NvimTreeFolderIcon      { Directory },
        NvimTreeSpecialFile     { gui = "nocombine" }, -- Idk a better way to remove the default underline

        -- Dashboard
        DashboardHeader         { String },
        DashboardFooter         { Comment },

        DashboardDesc           { Normal },
        DashboardKey            { String },
        DashboardIcon           { String },
        DashboardShortCut       { String },

        -- Lazy
        LazyButton              { Constant },
        LazyButtonActive        { fg = slate[840], bg = sky[300] },
        LazyComment             { Comment },
        LazyDimmed              { Special },
        LazyH1                  { LazyButtonActive },
        LazyH2                  { String },
        LazyLocal               { Comment },
        LazyProgressDone        { String },
        LazyProgressTodo        { Comment },
        LazyReasonEvent         { Special },
        LazyReasonPlugin        { Comment },
        LazyReasonRequire       { Special },
        LazyReasonStart         { Special },
        LazySpecial             { Special },

        -- Mason
        MasonHeader             { LazyButtonActive },
        MasonHeading            { LazyH2 },
        MasonHighlightBlockBold { LazyButtonActive },
        MasonMuted              { Special },
        MasonMutedBlock         { LazyButton },

        -- CMP
        CmpDocNormal            { bg = slate[860] },
        CmpItemAbbrDeprecated   { Special },
        CmpItemAbbrMatch        { String },
        CmpItemAbbrMatchFuzzy   { CmpItemAbbrMatch },
        CmpItemMenu             { Comment },
        CmpItemKind             { String },

        -- Copilot
        CopilotSuggestion       { Special },
    }
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
