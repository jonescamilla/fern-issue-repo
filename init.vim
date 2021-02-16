call plug#begin(stdpath('data') . '/plugged')

Plug 'lambdalisue/fern.vim'

call plug#end()

" Neovim users SHOULD add antoinemadec/FixCursorHold.nvim for now (See #120)
let g:cursorhold_updatetime = 100
