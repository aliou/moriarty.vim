"     __  __            _            _
"    |  \/  | ___  _ __(_) __ _ _ __| |_ _   _
"    | |\/| |/ _ \| '__| |/ _` | '__| __| | | |
"    | |  | | (_) | |  | | (_| | |  | |_| |_| |
"    |_|  |_|\___/|_|  |_|\__,_|_|   \__|\__, |
"                                        |___/
"
"   I've given you a glimpse, Sherlock. Just a tinsy glimspe of what I've got
"   going on out there in the big bad world. I'm a specialist you see, like you.
"
"   Made of Code + Bad Wolf

" Preamble {{{

if !has("gui_running") && &t_Co != 88 && &t_Co != 256
    finish
endif

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "moriarty"

" }}}
" Palette {{{
let s:mc = {}

" Our basic color.
let s:mc.plain = ['f8f8f8', 15]

" MJ at two different points in his life.
let s:mc.black = ['ffffff', 15]
let s:mc.white = ['000000', 16]

" The gravel colors from Bad Wolf.
let s:mc.brightgravel   = ['d9cec3', 252]
let s:mc.lightgravel    = ['998f84', 245]
let s:mc.gravel         = ['857f78', 243]
let s:mc.mediumgravel   = ['666462', 241]
let s:mc.deepgravel     = ['45413b', 238]
let s:mc.deepergravel   = ['35322d', 236]
let s:mc.darkgravel     = ['242321', 235]
let s:mc.blackgravel    = ['1c1b1a', 233]
let s:mc.blackestgravel = ['141413', 232]

" }}}
" Highlighting Function {{{
function! s:HL(group, fg, ...)
    " Arguments: group, guifg, guibg, gui, guisp

    let histring = 'hi ' . a:group . ' '

    if strlen(a:fg)
        if a:fg == 'fg'
            let histring .= 'guifg=fg ctermfg=fg '
        else
            let c = get(s:mc, a:fg)
            let histring .= 'guifg=#' . c[0] . ' ctermfg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 1 && strlen(a:1)
        if a:1 == 'bg'
            let histring .= 'guibg=bg ctermbg=bg '
        else
            let c = get(s:mc, a:1)
            let histring .= 'guibg=#' . c[0] . ' ctermbg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 2 && strlen(a:2)
        let histring .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
    endif

    if a:0 >= 3 && strlen(a:3)
        let c = get(s:mc, a:3)
        let histring .= 'guisp=#' . c[0] . ' '
    endif

    " echom histring

    execute histring
endfunction
" }}}

hi Cursor  guifg=NONE guibg=#00ffff gui=NONE
hi Visual  guifg=NONE guibg=#05448d gui=NONE
hi CursorLine  guifg=NONE guibg=#090a1b gui=NONE
hi CursorColumn  guifg=NONE guibg=#090a1b gui=NONE
hi LineNr  guifg=#81818a guibg=#090a1b gui=NONE
hi VertSplit  guifg=#363745 guibg=#363745 gui=NONE
hi MatchParen  guifg=#ff3854 guibg=NONE gui=NONE
hi StatusLine  guifg=#f8f8f8 guibg=#363745 gui=bold
hi StatusLineNC  guifg=#f8f8f8 guibg=#363745 gui=NONE
hi Pmenu  guifg=#6fd3ff guibg=NONE gui=NONE
hi PmenuSel  guifg=NONE guibg=#05448d gui=NONE
hi IncSearch  guifg=NONE guibg=#233466 gui=NONE
hi Search  guifg=NONE guibg=#233466 gui=NONE
hi Directory  guifg=#0a9cff guibg=NONE gui=NONE
hi Folded  guifg=#c050c2 guibg=#090a1b gui=NONE

hi Normal  guifg=#f8f8f8 guibg=#090a1b gui=NONE
hi Boolean  guifg=#0a9cff guibg=NONE gui=NONE
hi Character  guifg=#0a9cff guibg=NONE gui=NONE
hi Comment  guifg=#c050c2 guibg=#000000 gui=italic
hi Conditional  guifg=#ff3854 guibg=NONE gui=NONE
hi Constant  guifg=#0a9cff guibg=NONE gui=NONE
hi Define  guifg=#ff3854 guibg=NONE gui=NONE
hi ErrorMsg  guifg=NONE guibg=NONE gui=NONE
hi WarningMsg  guifg=NONE guibg=NONE gui=NONE
hi Float  guifg=#0a9cff guibg=NONE gui=NONE
hi Function  guifg=#6fd3ff guibg=NONE gui=NONE
hi Identifier  guifg=#99cf50 guibg=NONE gui=NONE
hi Keyword  guifg=#ff3854 guibg=NONE gui=NONE
hi Label  guifg=#8fff58 guibg=#102522 gui=NONE
hi NonText  guifg=#353c4f guibg=#090a1b gui=NONE
hi Number  guifg=#0a9cff guibg=NONE gui=NONE
hi Operator  guifg=#ff3854 guibg=NONE gui=NONE
hi PreProc  guifg=#ff3854 guibg=NONE gui=NONE
hi Special  guifg=#f8f8f8 guibg=NONE gui=NONE
hi SpecialKey  guifg=#353c4f guibg=#090a1b gui=NONE
hi Statement  guifg=#ff3854 guibg=NONE gui=NONE
hi StorageClass  guifg=#99cf50 guibg=NONE gui=NONE
hi String  guifg=#8fff58 guibg=#102522 gui=NONE
hi Tag  guifg=#6fd3ff guibg=NONE gui=NONE
hi Title  guifg=#f8f8f8 guibg=NONE gui=bold
hi Todo  guifg=#c050c2 guibg=#000000 gui=inverse,bold,italic
hi Type  guifg=#6fd3ff guibg=NONE gui=NONE
hi Underlined  guifg=NONE guibg=NONE gui=underline
hi rubyClass  guifg=#ff3854 guibg=NONE gui=NONE
hi rubyFunction  guifg=#6fd3ff guibg=NONE gui=NONE
hi rubyInterpolationDelimiter  guifg=NONE guibg=NONE gui=NONE
hi rubySymbol  guifg=#0a9cff guibg=NONE gui=NONE
hi rubyConstant  guifg=#00ffbc guibg=NONE gui=NONE
hi rubyStringDelimiter  guifg=#8fff58 guibg=#102522 gui=NONE
hi rubyBlockParameter  guifg=#588aff guibg=NONE gui=NONE
hi rubyInstanceVariable  guifg=#588aff guibg=NONE gui=NONE
hi rubyInclude  guifg=#ff3854 guibg=NONE gui=NONE
hi rubyGlobalVariable  guifg=#588aff guibg=NONE gui=NONE
hi rubyRegexp  guifg=#e9c062 guibg=NONE gui=NONE
hi rubyRegexpDelimiter  guifg=#e9c062 guibg=NONE gui=NONE
hi rubyEscape  guifg=#0a9cff guibg=NONE gui=NONE
hi rubyControl  guifg=#ff3854 guibg=NONE gui=NONE
hi rubyClassVariable  guifg=#588aff guibg=NONE gui=NONE
hi rubyOperator  guifg=#ff3854 guibg=NONE gui=NONE
hi rubyException  guifg=#ff3854 guibg=NONE gui=NONE
hi rubyPseudoVariable  guifg=#588aff guibg=NONE gui=NONE
hi rubyRailsUserClass  guifg=#00ffbc guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod  guifg=#f1d950 guibg=NONE gui=NONE
hi rubyRailsARMethod  guifg=#f1d950 guibg=NONE gui=NONE
hi rubyRailsRenderMethod  guifg=#f1d950 guibg=NONE gui=NONE
hi rubyRailsMethod  guifg=#f1d950 guibg=NONE gui=NONE
hi erubyDelimiter  guifg=NONE guibg=NONE gui=NONE
hi erubyComment  guifg=#c050c2 guibg=#000000 gui=italic
hi erubyRailsMethod  guifg=#f1d950 guibg=NONE gui=NONE
hi htmlTag  guifg=#45c1ea guibg=NONE gui=NONE
hi htmlEndTag  guifg=#45c1ea guibg=NONE gui=NONE
hi htmlTagName  guifg=#45c1ea guibg=NONE gui=NONE
hi htmlArg  guifg=#45c1ea guibg=NONE gui=NONE
hi htmlSpecialChar  guifg=#0a9cff guibg=NONE gui=NONE
hi javaScriptFunction  guifg=#99cf50 guibg=NONE gui=NONE
hi javaScriptRailsFunction  guifg=#f1d950 guibg=NONE gui=NONE
hi javaScriptBraces  guifg=NONE guibg=NONE gui=NONE
hi yamlKey  guifg=#6fd3ff guibg=NONE gui=NONE
hi yamlAnchor  guifg=#588aff guibg=NONE gui=NONE
hi yamlAlias  guifg=#588aff guibg=NONE gui=NONE
hi yamlDocumentHeader  guifg=#8fff58 guibg=#102522 gui=NONE
hi cssURL  guifg=#588aff guibg=NONE gui=NONE
hi cssFunctionName  guifg=#f1d950 guibg=NONE gui=NONE
hi cssColor  guifg=#0a9cff guibg=NONE gui=NONE
hi cssPseudoClassId  guifg=#6fd3ff guibg=NONE gui=NONE
hi cssClassName  guifg=#6fd3ff guibg=NONE gui=NONE
hi cssValueLength  guifg=#0a9cff guibg=NONE gui=NONE
hi cssCommonAttr  guifg=#cf6a4c guibg=NONE gui=NONE
hi cssBraces  guifg=NONE guibg=NONE gui=NONE
