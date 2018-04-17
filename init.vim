" Sanity check
if !has ('nvim')
	Plug 'tpope/vim-sensible'
endif

" Autocomplete engine
function! DoRemote(arg)
	UpdateRemotePlugins
endfunction

" _Install plugins
call plug#begin()
" Code
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') } " Autocomplete
Plug 'romain1/vim-cool' " Stop matching after search is done
"Plug 'jiangmiao/auto-pairs' " Autocomplete brackets
Plug 'zchee/deoplete-go', { 'do': 'make'} " Go autocomplete
Plug 'zchee/deoplete-jedi' " Autocompletion and static analysis
Plug 'w0rp/ale' " Asynchronus Lint Engine
"Plug 'Shougo/neoinclude.vim' " Snippets
"Plug 'Shougo/neosnippet.vim' " Community snippets
"Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets' " Comminity snippets
Plug 'Chiel92/vim-autoformat' " Easy code formatting TODO: use it
Plug 'sbdchd/neoformat' " Format code
"Plug 'rizzatti/dash.vim' " Search Dash app
Plug 'sheerun/vim-polyglot' " Language pack

" Looks
Plug 'bling/vim-bufferline' " TODO: doesn't show anything
"Plug 'ryanoasis/vim-devicons' " TODO: doesn't work
Plug 'ayu-theme/ayu-vim' " Theme
Plug 'vim-airline/vim-airline' " Nice looking status bar on the bottom
Plug 'vim-airline/vim-airline-themes' " TODO: not sure if need

" Syntax
"Plug 'isobit/vim-caddyfile' " Caddyfile syntax support

" Moving
Plug 'easymotion/vim-easymotion' " Vim motions on speed
Plug 'haya14busa/incsearch.vim' " Improved incremental searching
Plug 'haya14busa/incsearch-easymotion.vim'

" Utility
Plug 'jremmen/vim-ripgrep' " Use RipGrep in Vim and display results in a quickfix list
Plug 'scrooloose/nerdcommenter' " Quick comments TODO: use it
Plug 'unblevable/quick-scope' " Highlight f, F jumps
"Plug 'tweekmonster/startuptime.vim' " Profile startup time
Plug 'Shougo/vimproc.vim', {'do' : 'make'} " Interactive command excecution
"Plug 'junegunn/goyo.vim' " Distraction free writing
"Plug 'rking/ag.vim' " Lightning fast :Ag searcher
"Plug 'mbbill/undotree' " History visualiser
Plug 'tpope/vim-repeat' " Enable repeating supported plugin maps
Plug 'christoomey/vim-titlecase' " Titlecase text
Plug 'tpope/vim-surround' " Quoting/parenthesizing made simple
Plug 'junegunn/vim-easy-align'
"Plug 'godlygeek/tabular' " Text filtering and alignment
Plug 'junegunn/fzf.vim' " fzf fuzzy search
"Plug 'danro/rename.vim' " Allow to :Rename files
"Plug 'scrooloose/nerdtree' " Sidebar view
"Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'tpope/vim-vinegar'
"Plug 'justinmk/vim-dirvish' " Directory viewer
"Plug 'justinmk/vim-sneak'
"Plug 'junegunn/limelight.vim' " Highlight only active paragraphs
"Plug 'jiangmiao/auto-pairs' " TODO: make it not work in vimrc
"Plug 'tpope/vim-unimpaired' " TODO: doesn't work
"Plug 'terryma/vim-multiple-cursors'
"Plug 'dhruvasagar/vim-table-mode' " Insant table creation
"Plug 'tpope/vim-abolish' " TODO: not sure if need
"Plug 'ludovicchabant/vim-gutentags' " TODO: use it
Plug 'wakatime/vim-wakatime' " Track code time


" C
Plug 'zchee/deoplete-clang', { 'for': 'c,cpp,objc' }

" Latex
"Plug 'lervag/vimtex', { 'for': 'tex' }

" Javascript
"Plug 'ternjs/tern_for_vim', { 'for': 'javascript', 'do': 'npm install' }
"Plug 'carlitux/deoplete-ternjs', {'for': 'javascript', 'do': 'npm install -g tern'}

" Typescript
"Plug 'Quramy/tsuquyomi', {'for': 'typescript'}
"Plug 'Shougo/vimproc.vim', { 'for': 'typescript', 'build' : 'make'} " tsuquyomi dep

" Rust
"Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" Go
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'zchee/deoplete-go', { 'for': 'go', 'do': 'make'}

" Vim
Plug 'Shougo/neco-vim', { 'for': 'vim' }

" Nix
"Plug 'LnL7/vim-nix', { 'for': 'nix' }

" Git
Plug 'tpope/vim-fugitive' " Git wrapper
Plug 'mhinz/vim-signify' " 
Plug 'airblade/vim-gitgutter' " Show git diff in the gutter (sign column)
"Plug 'gregsexton/gitv' 
call plug#end()

let g:polyglot_disabled = ['go' , 'latex']

" _Basic config
filetype plugin indent on

set mouse=a
set undofile

set wildmenu
set wildmode=longest:list,full

" Easier navig
set number
set relativenumber

set updatetime=250 " NOTE: maybe needs increase

set visualbell

" TODO: not sure
" set rtp^=/usr/share/vim/vimfiles
" set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
" set rtp+=$GOPATH/src/github.com/junegunn/fzf

" TODO: Check if some of these settings come as default with neovim
let $NVIM_TUI_ENABLE_TRUE_COLOR=1 " Nice looking editor
set clipboard^=unnamed  " Copy text to system clipboard
set gdefault " Always do global substitutions
set clipboard^=unnamedplus
set title " Set terminal title
set whichwrap+=<,>,[,]
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set completeopt-=preview " No annoying scratch preview above
set expandtab " Spaces on tabs
set shiftwidth=4
set softtabstop=2
set backspace=indent,eol,start " Makes backspace key more powerful
set undolevels=1000
set smartindent " Indentation
set shortmess=Ia " Disable startup message

" Open help vertically
command! -nargs=* -complete=help Help vertical belowright help <args>
autocmd FileType help wincmd L

:autocmd InsertEnter,InsertLeave * set cul! " Notify on mode change visually

" Buffers
set hidden

" Folding
set foldcolumn=1
set foldlevel=20
set foldlevelstart=7
set foldmethod=syntax
set foldignore=""
set nofoldenable

" Searching
set wrapscan
set incsearch
set ignorecase
set smartcase
set gdefault

set hlsearch " Highlighting

" Usable 'Tab'
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

set autoindent

set fileencoding=utf-8 " Encoding when written to file

" Line endings
set fileformat=unix

" Completion
if has('nvim')
    set completeopt+=menu,menuone
endif

" Set terminal title
set title

set grepprg=rg\ --vimgrep
set grepformat^=%f:%l:%c:%m

set viewoptions=cursor,slash,unix

" _Basic UI config
set relativenumber " Relative to current posion line numbers
set number " Show line numbers
set cursorline  " Highlight current line
let python_highlight_all = 1
set showmatch
set tabstop=4 " Default indentation is 4 spaces long and uses tabs, not spaces
set matchtime=2
set termguicolors " Enable true colors support

" _Plugin modifications
let g:deoplete#enable_at_startup = 1 " Activate deoplete

" _Theme
set background=dark " Set night mode
let ayucolor="mirage" " For mirage version of theme
colorscheme ayu

" _Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='tomorrow' " Status bar theme
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1

let g:airline#extensions#tabline#tab_min_count = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 2

" Bufferline
let g:bufferline_echo = 0
