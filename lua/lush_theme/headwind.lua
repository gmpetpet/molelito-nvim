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
    [200] = "#fccee8",
    [300] = "#fda5d5",
    [400] = "#fb64b6",
}

local sky = {
    [200] = "#b8e6fe",
    [300] = "#74d4ff",
    [400] = "#00bcff",
    [500] = "#00a6f4",
    [900] = "#024a70",
}

local green = {
    [200] = "#b9f8cf",
    [300] = "#7bf1a8",
    [400] = "#05df72",
    [500] = "#00c951",
}

local gray = {
    [50] = "#f9fafb",
    [100] = "#f3f4f6",
    [200] = "#e5e7eb",
    [300] = "#d1d5dc",
    [400] = "#99a1af",
    [500] = "#6a7282",
    [600] = "#4a5565",
    [700] = "#364153",
    [800] = "#1e2939",
    [900] = "#101828",
    [950] = "#030712",
}

-- Custom colors
gray[935] = hsl(gray[950]).lighten(3).desaturate(25)
gray[945] = hsl(gray[950]).lighten(1)

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
        Conceal        { fg = gray[100], bg = gray[700] }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
        Cursor         { fg = gray[950], bg = sky[300] }, -- Character under the cursor
        CurSearch      { bg = sky[500] }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
        -- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
        -- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
        -- CursorColumn   { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
        CursorLine     { bg = gray[920] }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
        Directory      { fg = sky[300] }, -- Directory names (and other special names in listings)
        DiffAdd        { fg = green[200], bg = gray[950] }, -- Diff mode: Added line |diff.txt|
        DiffChange     { fg = sky[300], bg = gray[950] }, -- Diff mode: Changed line |diff.txt|
        DiffDelete     { fg = pink[400], bg = gray[950] }, -- Diff mode: Deleted line |diff.txt|
        DiffText       { Conceal }, -- Diff mode: Changed text within a changed line |diff.txt|
        EndOfBuffer    { fg = gray[950] }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
        -- TermCursor     { }, -- Cursor in a focused terminal
        -- TermCursorNC   { }, -- Cursor in an unfocused terminal
        ErrorMsg       { fg = pink[400] }, -- Error messages on the command line
        VertSplit      { fg = gray[950] }, -- Column separating vertically split windows
        Folded         { fg = sky[300], bg = gray[950] }, -- Line used for closed folds
        FoldColumn     { fg = sky[300], bg = gray[950] }, -- 'foldcolumn'
        --SignColumn     { bg = gray[850] } , -- Column where |signs| are displayed
        IncSearch      { fg = gray[950], bg = sky[300] }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
        -- Substitute     { }, -- |:substitute| replacement text highlighting
        LineNr         { fg = gray[700] }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
        -- LineNrAbove    { }, -- Line number for when the 'relativenumber' option is set, above the cursor line
        -- LineNrBelow    { }, -- Line number for when the 'relativenumber' option is set, below the cursor line
        CursorLineNr   { fg = gray[700] }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
        -- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
        -- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
        MatchParen     { fg = gray[100], bg = gray[600] }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
        -- ModeMsg        { }, -- 'showmode' message (e.g., "-- INSERT -- ")
        -- MsgArea        { }, -- Area for messages and cmdline
        -- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
        MoreMsg        { fg = green[200] }, -- |more-prompt|
        -- NonText        { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
        Normal         { fg = gray[50], bg = gray[950] }, -- Normal text
        NormalFloat    { bg = gray[905] }, -- Normal text in floating windows.
        FloatBorder    { bg = gray[915] }, -- Border of floating windows.
        -- FloatTitle     { }, -- Title of floating windows.
        -- NormalNC       { }, -- normal text in non-current windows
        Pmenu          { bg = gray[905] }, -- Popup menu: Normal item.
        PmenuSel       { fg = gray[905], bg = sky[300] }, -- Popup menu: Selected item.
        -- PmenuKind      { }, -- Popup menu: Normal item "kind"
        -- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
        -- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
        -- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
        PmenuSbar      { bg = gray[905] }, -- Popup menu: Scrollbar.
        PmenuThumb     { bg = gray[700] }, -- Popup menu: Thumb of the scrollbar.
        Question       { fg = green[200] }, -- |hit-enter| prompt and yes/no questions
        -- QuickFixLine   { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
        Search         { fg = gray[950], bg = sky[300] }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
        -- SpecialKey     { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
        -- SpellBad       { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
        -- SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
        -- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
        -- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
        StatusLine     { }, -- Status line of current window
        StatusLineNC   { }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
        -- TabLine        { }, -- Tab pages line, not active tab page label
        -- TabLineFill    { }, -- Tab pages line, where there are no labels
        -- TabLineSel     { }, -- Tab pages line, active tab page label
        Title          { fg = pink[400] }, -- Titles for output from ":set all", ":autocmd" etc.
        Visual         { fg = gray[300], bg = gray[700] }, -- Visual mode selection
        -- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
        -- WarningMsg     { }, -- Warning messages
        -- Whitespace     { }, -- "n6sp", "space", "tab" and "trail" in 'listchars'
        Winseparator   { fg = gray[950] }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
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

        Comment        { fg = gray[700] }, -- Any comment

        Constant       { fg = gray[50] }, -- (*) Any constant
        String         { fg = sky[300] }, --   A string constant: "this is a string"
        -- Character      { }, --   A character constant: 'c', '\n'
        -- Number         { }, --   A number constant: 234, 0xff
        Boolean        { fg = sky[300] }, --   A boolean constant: TRUE, false
        -- Float          { }, --   A floating point constant: 2.3e10

        Identifier     { fg = gray[50] }, -- (*) Any variable name
        Function       { fg = gray[50] }, --{ fg = pink[400] }, --   Function name (also: methods for classes)

        Statement      { fg = gray[500] }, -- (*) Any statement
        -- Conditional    { }, --   if, then, else, endif, switch, etc.
        -- Repeat         { }, --   for, do, while, etc.
        -- Label          { }, --   case, default, etc.
        Operator       { fg = gray[500] }, --   "sizeof", "+", "*", etc.
        -- Keyword        { }, --   any other keyword
        -- Exception      { }, --   try, catch, throw

        PreProc        { fg = gray[500] }, -- (*) Generic Preprocessor
        -- Include        { }, --   Preprocessor #include
        -- Define         { }, --   Preprocessor #define
        -- Macro          { }, --   Same as Define
        -- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

        Type           { Statement }, -- (*) int, long, char, etc.
        -- StorageClass   { }, --   static, register, volatile, etc.
        -- Structure      { }, --   struct, union, enum, etc.
        -- Typedef        { }, --   A typedef

        Special        { fg = gray[500] }, -- (*) Any special symbol
        -- SpecialChar    { }, --   Special character in a constant
        -- Tag            { }, --   You can use CTRL-] on this
        -- Delimiter      { }, --   Character that needs attention
        SpecialComment { fg = gray[600] }, --   Special things inside a comment (e.g. '\n')
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
        sym"@text.literal.block.vimdoc" { CursorLineNr }, -- Vimdoc
        sym"@text.literal.vimdoc" { String }, -- Vimdoc
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
        -- sym"@constructor.typescript" { Comment },
        sym"@type.typescript"   { Statement },

        -- Telescope
        -- TelescopeNormal         { }
        -- TelescopeBorder         { }
        -- TelescopePromptPrefix   { }
        TelescopeMatching       { fg = sky[300] },
        TelescopeSelection      { bg = gray[905] },
        TelescopeSelectionCaret { fg = sky[300], bg = gray[935] },

        TelescopePromptNormal   { fg = gray[50], bg = gray[945] },
        TelescopePromptBorder   { fg = gray[945], bg = gray[945] },
        TelescopePromptTitle    { fg = gray[945], bg = gray[945] },
        TelescopePromptCounter  { fg = gray[700] },

        TelescopePreviewNormal  { fg = gray[50], bg = gray[935] },
        TelescopePreviewBorder  { fg = gray[935], bg = gray[935] },
        TelescopePreviewTitle   { fg = gray[935], bg = pink[400] },

        TelescopeResultsNormal  { fg = gray[50], bg = gray[945] },
        TelescopeResultsBorder  { fg = gray[945], bg = gray[945] },
        TelescopeResultsTitle   { fg = gray[945], bg = sky[300] },

        -- Alpha
        AlphaStartLogo1         { fg = hsl(sky[200]).darken(53) },
        AlphaStartLogo2         { fg = hsl(sky[200]).darken(50) },
        AlphaStartLogo3         { fg = hsl(sky[200]).darken(47) },
        AlphaStartLogo4         { fg = hsl(sky[200]).darken(44) },
        AlphaStartLogo5         { fg = hsl(sky[200]).darken(41) },
        AlphaStartLogo6         { fg = hsl(sky[200]).darken(38) },
        AlphaStartLogo7         { fg = hsl(sky[200]).darken(35) },
        AlphaStartLogo8         { fg = hsl(sky[200]).darken(32) },
        AlphaStartLogo9         { fg = hsl(sky[200]).darken(29) },
        AlphaStartLogo10        { fg = hsl(sky[200]).darken(26) },
        AlphaStartLogo11        { fg = hsl(sky[200]).darken(23) },
        AlphaStartLogo12        { fg = hsl(sky[200]).darken(20) },

        -- Bufferline
        BufferlineBufferVisible  { fg = sky[200], bg = gray[915] },
        BufferlineBufferSelected { fg = sky[300], bg = gray[915] },

        -- NvimTree
        NvimTreeNormal          { Normal },
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
        LazyButtonActive        { fg = gray[950], bg = sky[300] },
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
        CmpDocNormal            { bg = gray[950] },
        CmpItemAbbrDeprecated   { Special },
        CmpItemAbbrMatch        { String },
        CmpItemAbbrMatchFuzzy   { CmpItemAbbrMatch },
        CmpItemMenu             { Comment },
        CmpItemKind             { String },

        -- Copilot
        CopilotSuggestion       { Special },

        -- Markdown (fix to prevent underscores showing as markdown errors)
        markdownError           { ErrorMsg },

        -- Gitsigns
        GitSignsCurrentLineBlame { Comment },

        -- Mini
        MiniJump               { fg = green[200], gui = "nocombine" },
        MiniJump2dSpot         { fg = green[200], bold = false, italic = false },
        MiniStarterCurrent     { String },
        MiniStarterFooter      { Comment },
        MiniStarterHeader      { String },
        MiniStarterInactive    { Comment },
        MiniStarterItem        { Normal },
        MiniStarterItemBullet  { String },
        MiniStarterItemPrefix  { String },
        MiniStatuslineDevinfo  { fg = gray[500], bg = gray[915] },
        MiniStatuslineFileinfo { fg = gray[700], bg = gray[950] },
        MiniStatuslineFilename { fg = gray[700], bg = gray[950] },
        MiniStatuslineInactive { MiniStatuslineFileinfo },
        MiniStatuslineLocation { MiniStatuslineDevinfo },
        MiniTablineCurrent     { fg = sky[300], bg = gray[950] },
        MiniTablineVisible     { Normal },
        MiniTablineHidden      { fg = gray[700], bg = gray[950] },
        MiniTablineModifiedCurrent { MiniTablineCurrent },
        MiniTablineModifiedVisible { MiniTablineVisible },
        MiniTablineModifiedHidden  { MiniTablineHidden },

        MiniTrailspace         { TelescopePreviewTitle },
    }
end)

-- Return our parsed theme for extension or use elsewhere.
return theme
