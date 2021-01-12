syntax on
set hidden
set number
set autoindent

call plug#begin()
" style
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" tools
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'jiangmiao/auto-pairs'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Syntax format for jsx
Plug 'maxmellon/vim-jsx-pretty'

Plug 'w0rp/ale'

call plug#end()

" Status bar plugin (vim-airline)
let g:airline_left_sep = ''
let g:airline_right_sep = ''
" vim javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

" Abrir NerdTree assim q abrir
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" ///

set nocompatible
set encoding=utf8
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" Short Cuts
map <C-B> :NERDTreeToggle<CR>
map <C-F> :NERDTreeFind<CR>
map <F5> :e!<CR>
