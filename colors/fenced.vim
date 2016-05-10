" Fenced.vim

" Preamble {{{

if !has("gui_running") && &t_Co != 88 && &t_Co != 256
  finish
endif

" TODO: Make it work with both light and dark backgrounds.
set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "fenced"

" }}}

