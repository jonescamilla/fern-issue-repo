
call plug#begin(stdpath('data') . '/plugged')


" fern.vim (file tree)
Plug 'lambdalisue/fern.vim'
Plug 'antoinemadec/FixCursorHold.nvim' 	" suggested in fern docs
Plug 'lambdalisue/fern-git-status.vim' 	" git integration
Plug 'lambdalisue/glyph-palette.vim' 	" file icons
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/nerdfont.vim'
" Plug 'lambdalisue/fern-hijack.vim' 	" make fern the default file exp
" plugin does not work for me since I have special visual settings for fern
"
" terminate plugin system
call plug#end()

" Neovim users SHOULD add antoinemadec/FixCursorHold.nvim for now (See #120)
let g:cursorhold_updatetime = 100


" Exclude and include in fern
let g:fern#default_exclude = '^\%(\.git\|node_modules\|\.DS_Store\|\.netrwhist\)$'
" let g:fern#default_exclude = '^\%(node_modules\)$'
let g:fern#default_include = ''

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fern mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" disable all default fern mappings
let g:fern#disable_default_mappings = 1

" toggle binding for fern
noremap <silent> <Leader>f :Fern . -drawer -reveal=% -toggle -width=25<CR><C-w>=

" custom mappings (taken from their documentation added binds at the bottom)
function! FernInit() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
" will open file on `enter`
  nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
" double clicking file will open the file (will always open to the side
" because fern is in drawer mode)
  nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> p <Plug>(fern-action-new-path)
  nmap <buffer> n <Plug>(fern-action-new-file)
" fern remove action
  nmap <buffer> d <Plug>(fern-action-remove)
  nmap <buffer> m <Plug>(fern-action-move)
  nmap <buffer> R <Plug>(fern-action-rename)
" toggles showing hidden files or not
  nmap <buffer> , <Plug>(fern-action-hidden-toggle)
" reloads fern to matche w/ system (fern is not aware of outside changes)
  nmap <buffer> r <Plug>(fern-action-reload)
" mark a file with fern
  nmap <buffer> k <Plug>(fern-action-mark:toggle)
" will open file in horizontal split
  nmap <buffer> h <Plug>(fern-action-open:split)
" will open file in vertical split
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
" move forward in a directory
  nmap <buffer><nowait> < <Plug>(fern-action-leave)
" move backwards in a directory
  nmap <buffer><nowait> > <Plug>(fern-action-enter)
" expand folder
  nmap <buffer><nowait> e <Plug>(fern-action-expand)
" collapse folder
  nmap <buffer><nowait> E <Plug>(fern-action-collapse)
" zoom into fern to reveal more 
  nmap <buffer><nowait> z <Plug>(fern-action-zoom)
endfunction

augroup FernGroup
  autocmd!
  autocmd FileType fern call FernInit()
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fern theming
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" straight from docs for glyph-palette (no clue what this does)
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

" nerdfont renderer (is the echo necessary?)
echo nerdfont#find()
let g:fern#renderer = 'nerdfont'

" turn off line numbers and synbol column in fern
:autocmd FileType fern set nonumber
:autocmd FileType fern set signcolumn=no
