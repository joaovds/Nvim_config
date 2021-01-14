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
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'mattn/emmet-vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Syntax format for jsx
Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'w0rp/ale'

Plug 'othree/yajs.vim'

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
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
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
" vim javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1


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

" ========== Configurar ALE ==========

let g:jsx_ext_required = 0

let g:ale_linters = {
\   'javascript': ['standard'],
\}

let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_linters_explicit = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options = '--single-quote'

" ========== Configurar Emmet.vim para tsx (jsx) ==========

let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}
autocmd FileType html,css,javascript.jsx EmmetInstall

" ========== Scrolling ==========

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ========== Short Cuts ==========
map <C-B> :NERDTreeToggle<CR>
map <C-F> :NERDTreeFind<CR>
map <F5> :e!<CR>

map <leader>W :w<CR>

"nmap <ESC> :call coc#util#float_hide() <CR>
nmap <silent> k :call CocAction('doHover')<CR>
"autocmd CursorHold * silent call CocActionAsync('doHover')
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
