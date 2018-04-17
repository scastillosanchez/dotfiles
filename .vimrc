set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree' "File tree view
Plugin 'vim-airline/vim-airline'   "Lean & mean status/tabline
Plugin 'vim-airline/vim-airline-themes' "Themes for airline
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/syntastic'
Plugin 'flazz/vim-colorschemes'
Plugin 'ayu-theme/ayu-vim'
Plugin 'romain1/vim-cool'
Plugin 'sheerun/vim-polyglot'

" Syntax highlighting
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'



call vundle#end()

" ### Plugin configs 
" Nerd Tree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <C-n> :NERDTreeToggle<CR>

"Emmet vim
"let g:user_emmet_leader_key='<leader><leader>'

" Syntastic
" Recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let syntastic_loc_list_height=4

" Checkers
let g:syntastic_javascript_checkers = ['eslint', 'standard']

" .jsx
let g:jsx_ext_required = 0

" Airline
set laststatus=2

" Theme
"colorscheme Slate

" ### Vanilla vim configs

syntax on
set number
" colorscheme gruvbox
set t_Co=256 " Enable 256 colors

"Ayu Theme
set termguicolors
set background=dark
let ayucolor="mirage"
colorscheme ayu


filetype plugin indent on

set ruler " Always show the current position
set cursorline "Highlight current line

set autowrite "Automatically :write before running commands
set autoread " Reload files changed outside vim

set relativenumber

set noerrorbells
set novisualbell

set shiftwidth=4
set tabstop=4

set ai
set si
set wrap

set ttyfast
set mouse=a
