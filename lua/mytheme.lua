---@diagnostic disable: undefined-global

local lush = require('lush')
local hsl = lush.hsl

local gray0   = hsl(221, 15,  2)
local gray1   = hsl(221, 15, 12)
local gray2   = hsl(221, 15, 22)
local gray3   = hsl(221, 15, 32)
local gray4   = hsl(221, 15, 42)
local gray5   = hsl(221, 15, 52)
local gray6   = hsl(221, 15, 62)
local gray7   = hsl(221, 15, 72)
local gray8   = hsl(221, 15, 82)
local gray9   = hsl(221, 15, 92)

local green   = hsl(159,  70, 51)
local yellow  = hsl( 42, 100, 68)
local pink    = hsl(340,  94, 74)
local cyan    = hsl(188,  64, 58)
local purple  = hsl(258,  45, 69)

-- local magneta = hsl(295,  85, 72)
-- local red     = hsl(349, 100, 65)
-- local orange  = hsl( 32, 100, 49)
-- local blue    = hsl(217,  69, 66)

local bg   = gray2
local fg = gray9

local theme = lush(function()
  return {

    -- vim ui --

    CursorLine   { fg = nil,    bg = nil }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    Visual       { fg = nil,    bg = gray4  }, -- Visual mode selection
    LineNr       { fg = gray4,  bg = nil    },
    CursorLineNr { fg = gray9,  bg = nil    },
    Search       { fg = gray0,  bg = green  },
    IncSearch    { fg = gray0,  bg = yellow },
    Pmenu        { fg = nil,    bg = gray3  }, -- Popup menu: normal item.
    PmenuSel     { fg = gray1,  bg = green  }, -- Popup menu: selected item.
    TabLine      { fg = nil,    bg = gray3  }, -- tab pages line, not active tab page label
    TabLineFill  { fg = nil,    bg = gray3  }, -- tab pages line, where there are no labels
    TabLineSel   { fg = gray1,    bg = green  }, -- tab pages line, active tab page label
    CursorColumn { fg = nil,    bg = nil    }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    ColorColumn  { fg = nil,    bg = nil    }, -- used for the columns set with 'colorcolumn'
    PmenuSbar    { fg = nil,    bg = nil    }, -- Popup menu: scrollbar.
    PmenuThumb   { fg = nil,    bg = nil,   }, -- Popup menu: Thumb of the scrollbar.
    NormalFloat  { fg = nil,    bg = gray4  }, -- Normal text in floating windows.
    VertSplit    { fg = gray3,  bg = nil    }, -- the column separating vertically split windows
    StatusLine   { fg = fg,     bg = gray3  }, -- status line of current window
    StatusLineNC { fg = fg,     bg = gray3  }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    SignColumn   { fg = nil,    bg = nil    }, -- column where |signs| are displayed
    FoldColumn   { bg = nil,    fg = gray3  }, -- 'foldcolumn'
    Folded       { fg = nil,    bg = gray4  }, -- line used for closed folds

    DiffAdd      { fg = green,  bg = nil    }, -- diff mode: Added line |diff.txt|
    DiffChange   { fg = yellow, bg = nil    }, -- diff mode: Changed line |diff.txt|
    DiffDelete   { fg = pink,   bg = nil    }, -- diff mode: Deleted line |diff.txt|
    DiffText     { fg = cyan,   bg = nil    }, -- diff mode: Changed text within a changed line |diff.txt|

    -- coc.nvim --

    CocErrorSign     { fg = pink,   bg = nil  },
    CocWarningSign   { fg = yellow, bg = nil  },
    CocHintSign      { fg = cyan,   bg = nil  },

    CocErrorHighlight   { fg = nil, bg = nil, gui="underline"   }, -- for error code range.
    CocWarningHighlight { fg = nil, bg = nil, gui="underline" }, -- for warning code range.
    CocInfoHighlight    { fg = nil, bg = nil, gui="underline" }, -- for information code range.
    CocHintHighlight    { fg = nil, bg = nil, gui="underline"   },-- for hint code range.

    -- vim-gitgutter --

    GitGutterAdd    { fg = green,  bg = nil },
    GitGutterChange { fg = yellow, bg = nil },
    GitGutterDelete { fg = pink,   bg = nil },

    -- floatterm --

    FloatermBorder { fg = gray3, bg = gray3   }, -- hide the border and title
    Floaterm       { fg = nil,   bg = gray3 },

    -- NTBBloodbath/rest.nvim --

    httpPath       { fg = pink, bg = nil },
    httpResultPath { fg = pink, bg = nil },
    httpMethod     { fg = gray0, bg = yellow },
    httpComment    { fg = green, bg = nil },
    httpHeaderKey  { fg = cyan, bg = nil },

    --
    IndentBlanklineChar { fg = gray3, bg = nil },

    -- syntax --

    Normal         { fg = fg,     bg = bg                }, -- normal text
    Whitespace     { fg = gray3,  bg = nil               }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    Comment        { fg = gray5,  bg = nil               },
    Type           { fg = green,  bg = nil               },
    Keyword        { fg = pink,   bg = nil, gui="italic" }, --  any other keyword
    String         { fg = yellow, bg = nil               }, --   a string constant: "this is a string"

    Identifier     { fg = cyan,   bg = nil               }, -- (preferred) any variable name
    Constant       { fg = cyan,   bg = nil               }, -- (preferred) any constant
    Character      { fg = cyan,   bg = nil               }, --  a character constant: 'c', '\n'
    Number         { fg = cyan,   bg = nil               }, --   a number constant: 234, 0xff
    Boolean        { fg = cyan,   bg = nil               }, --  a boolean constant: TRUE, false
    Float          { fg = cyan,   bg = nil               }, --    a floating point constant: 2.3e10

    Function       { fg = gray8,   bg = nil               }, -- function name (also: methods for classes)

    Statement      { fg = yellow, bg = nil               }, -- (preferred) any statement
    Conditional    { fg = yellow, bg = nil               }, --  if, then, else, endif, switch, etc.
    Repeat         { fg = yellow, bg = nil               }, --   for, do, while, etc.
    Label          { fg = yellow, bg = nil               }, --    case, default, etc.
    Operator       { fg = yellow, bg = nil               }, -- "sizeof", "+", "*", etc.
    Exception      { fg = yellow, bg = nil               }, --  try, catch, throw

    PreProc        { fg = pink,   bg = nil               }, -- (preferred) generic Preprocessor
    Include        { fg = pink,   bg = nil               }, --  preprocessor #include
    Define         { fg = pink,   bg = nil               }, --   preprocessor #define
    Macro          { fg = pink,   bg = nil               }, --    same as Define
    PreCondit      { fg = pink,   bg = nil               }, --  preprocessor #if, #else, #endif, etc.

    StorageClass   { fg = green,  bg = nil               }, -- static, register, volatile, etc.
    Structure      { fg = green,  bg = nil               }, --  struct, union, enum, etc.
    Typedef        { fg = green,  bg = nil               }, --  A typedef

    Special        { fg = cyan, bg = nil               }, -- (preferred) any special symbol
    SpecialChar    { fg = cyan, bg = nil               }, --  special character in a constant
    Tag            { fg = cyan, bg = nil               }, --    you can use CTRL-] on this
    Delimiter      { fg = cyan, bg = nil               }, --  character that needs attention
    SpecialComment { fg = cyan, bg = nil               }, -- special things inside a comment
    Debug          { fg = cyan, bg = nil               }, --    debugging statements

    Title        { fg = purple, bg = nil }, -- titles for output from ":set all", ":autocmd" etc.

    -- Telescope prompt count number link this
    NonText { fg = gray7 },

    -- Conceal      { }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    -- Cursor       { }, -- character under the cursor
    -- lCursor      { }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM     { }, -- like Cursor, but used when in IME mode |CursorIM|
    -- Directory    { }, -- directory names (and other special names in listings)
    -- EndOfBuffer  { }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    -- TermCursor   { }, -- cursor in a focused terminal
    -- TermCursorNC { }, -- cursor in an unfocused terminal
    -- ErrorMsg     { }, -- error messages on the command line
    -- Substitute   { }, -- |:substitute| replacement text highlighting
    -- MatchParen   { }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- ModeMsg      { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea      { }, -- Area for messages and cmdline
    -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    -- MoreMsg      { }, -- |more-prompt|
    -- NonText      { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    -- NormalNC     { }, -- normal text in non-current windows
    -- Question     { }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    -- SpecialKey   { }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    -- SpellBad     { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    -- VisualNOS    { }, -- Visual mode selection when vim is "Not Owning the Selection".
    -- WarningMsg   { }, -- warning messages
    -- Whitespace   { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- WildMenu     { }, -- current match in 'wildmenu' completion

    Todo           { bg = pink, fg = gray0 }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    TSWarning { fg = gray0, bg = yellow },
    -- TSError              { }, -- For syntax/parser errors.
    -- TSPunctDelimiter     { }, -- For delimiters ie: `.`
    -- TSPunctBracket       { }, -- For brackets and parens.
    -- TSPunctSpecial       { }, -- For special punctutation that does not fall in the catagories before.
    -- TSConstant           { }, -- For constants
    -- TSConstBuiltin       { }, -- For constant that are built in the language: `nil` in Lua.
    -- TSConstMacro         { }, -- For constants that are defined by macros: `NULL` in C.
    -- TSString             { }, -- For strings.
    -- TSStringRegex        { }, -- For regexes.
    -- TSStringEscape       { }, -- For escape characters within a string.
    -- TSCharacter          { }, -- For characters.
    -- TSNumber             { }, -- For integers.
    -- TSBoolean            { }, -- For booleans.
    -- TSFloat              { }, -- For floats.
    -- TSFunction           { }, -- For function (calls and definitions).
    -- TSFuncBuiltin        { }, -- For builtin functions: `table.insert` in Lua.
    -- TSFuncMacro          { }, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    -- TSParameter          { }, -- For parameters of a function.
    -- TSParameterReference { }, -- For references to parameters of a function.
    -- TSMethod             { }, -- For method calls and definitions.
    -- TSField              { }, -- For fields.
    -- TSProperty           { }, -- Same as `TSField`.
    -- TSConstructor        { }, -- For constructor calls and definitions: `                                                                       { }` in Lua, and Java constructors.
    -- TSConditional        { }, -- For keywords related to conditionnals.
    -- TSRepeat             { }, -- For keywords related to loops.
    -- TSLabel              { }, -- For labels: `label:` in C and `:label:` in Lua.
    -- TSOperator           { }, -- For any operator: `+`, but also `->` and `*` in C.
    -- TSKeyword            { }, -- For keywords that don't fall in previous categories.
    -- TSKeywordFunction    { }, -- For keywords used to define a fuction.
    -- TSException          { }, -- For exception related keywords.
    -- TSType               { }, -- For types.
    -- TSTypeBuiltin        { }, -- For builtin types (you guessed it, right ?).
    -- TSNamespace          { }, -- For identifiers referring to modules and namespaces.
    -- TSInclude            { }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    -- TSAnnotation         { }, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    -- TSText               { }, -- For strings considered text in a markup language.
    -- TSStrong             { }, -- For text to be represented with strong.
    -- TSEmphasis           { }, -- For text to be represented with emphasis.
    -- TSUnderline          { }, -- For text to be represented with an underline.
    -- TSTitle              { }, -- Text that is part of a title.
    -- TSLiteral            { }, -- Literal text.
    -- TSURI                { }, -- Any URI like a link or email.
    -- TSVariable           { }, -- Any variable name that does not have another highlight.
    -- TSVariableBuiltin    { }, -- Variable names that are defined by the languages, like `this` or `self`.

    -- Underlined { gui = "underline" }, -- (preferred) text that stands out, HTML links
    -- Bold       { gui = "bold" },
    -- Italic     { gui = "italic" },

    -- ("Ignore", below, may be invisible...)
    -- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

    -- Error          { }, -- (preferred) any erroneous construct


    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.


    -- These groups are for the native LSP client. Some other LSP clients may use
    -- these groups, or use their own. Consult your LSP client's documentation.

    -- LspDiagnosticsError               { }, -- used for "Error" diagnostic virtual text
    -- LspDiagnosticsErrorSign           { }, -- used for "Error" diagnostic signs in sign column
    -- LspDiagnosticsErrorFloating       { }, -- used for "Error" diagnostic messages in the diagnostics float
    -- LspDiagnosticsWarning             { }, -- used for "Warning" diagnostic virtual text
    -- LspDiagnosticsWarningSign         { }, -- used for "Warning" diagnostic signs in sign column
    -- LspDiagnosticsWarningFloating     { }, -- used for "Warning" diagnostic messages in the diagnostics float
    -- LspDiagnosticsInformation         { }, -- used for "Information" diagnostic virtual text
    -- LspDiagnosticsInformationSign     { }, -- used for "Information" signs in sign column
    -- LspDiagnosticsInformationFloating { }, -- used for "Information" diagnostic messages in the diagnostics float
    -- LspDiagnosticsHint                { }, -- used for "Hint" diagnostic virtual text
    -- LspDiagnosticsHintSign            { }, -- used for "Hint" diagnostic signs in sign column
    -- LspDiagnosticsHintFloating        { }, -- used for "Hint" diagnostic messages in the diagnostics float
    -- LspReferenceText                  { }, -- used for highlighting "text" references
    -- LspReferenceRead                  { }, -- used for highlighting "read" references
    -- LspReferenceWrite                 { }, -- used for highlighting "write" references

    -- https://github.com/nvim-telescope/telescope.nvim/blob/master/plugin/telescope.vim
    TelescopeNormal         { bg = gray3 },
    TelescopeBorder         { bg = gray3, fg = gray3 }, -- hide border
    TelescopeResultsNumber  { fg = gray4, bg = green },
    TelescopeResultsLineNr  { fg = cyan },
    TelescopePreviewNormal  { bg = gray3 },
    -- TelescopeResultsDiffUntracked { fg = green },
    -- TelescopePreviewHyphen { fg = green },
  }
end)

return theme
