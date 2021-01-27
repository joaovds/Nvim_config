syntax on
filetype plugin on

" ========== Plugins ==========

call plug#begin()
" style
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim'

Plug 'ryanoasis/vim-devicons'

" tools
Plug 'scrooloose/nerdtree'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
Plug 'lilydjwg/colorizer'

Plug 'elixir-editors/vim-elixir'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


set hidden
set number
set autoindent
set nocompatible
set encoding=UTF-8
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

colorscheme dracula
set background=dark

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-elixir',
  \ 'coc-json',
  \ ]
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
autocmd CursorHold * silent call CocActionAsync('highlight')
" end coc config

" Status bar plugin (vim-airline)
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Abrir NerdTree assim q abrir
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


" NerdCommenter
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1

" Use <c-space> para acionar o 'complete' (coc).
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use TAB para acionar o 'complete' (coc).
" inoremap <silent><expr> <TAB>
      " \ pumvisible() ? coc#_select_confirm() :
      " \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      " \ <SID>check_back_space() ? "\<TAB>" :
      " \ coc#refresh()

" function! s:check_back_space() abort
  " let col = col('.') - 1
  " return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" let g:coc_snippet_next = '<tab>'

" ========== Scrolling ==========

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ========== Short Cuts ==========
map <C-B> :NERDTreeToggle<CR>
map <C-F> :NERDTreeFind<CR>
map <F5> :e!<CR>

map <leader>W :w<CR>
