"  __  __        __     _____ __  __ ____   ____
" |  \/  |_   _  \ \   / /_ _|  \/  |  _ \ / ___|
" | |\/| | | | |  \ \ / / | || |\/| | |_) | |
" | |  | | |_| |   \ V /  | || |  | |  _ <| |___
" |_|  |_|\__, |    \_/  |___|_|  |_|_| \_\\____|
"         |___/


set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8

set clipboard=unnamed

" Prevent incorrect backgroung rendering
let &t_ut=''

" ===
" === Main code display
" ===
set number
set relativenumber
set ruler
set cursorline
syntax enable
syntax on

" ===
" === Editor behavior
" ===
" Better tab
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=5

" Prevent auto line split
set wrap
set tw=0

set indentexpr=
" Better backspace
set backspace=indent,eol,start

set foldmethod=indent
set foldlevel=99

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" ===
" === Window behaviors
" ===
set splitright
set splitbelow

" ===
" === Status/command bar
" ===
set laststatus=2
set autochdir
set showcmd
set formatoptions-=tc

" Show command autocomplete
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full

" Searching options
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase


" ===
" === Restore Cursor Position
" ===
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" ===
" === Basic Mappings
" ===

" Set <LEADER> as <SPACE>
let mapleader=" "

" Undo in Insert mode
inoremap <C-c> <C-v>
noremap j h
noremap m j
noremap K 8k
noremap M 8j




map Q :q<CR>
map S :w<CR>
map <C-z> <C-v>
map sl :set splitright<CR>:vsplit<CR>
map sj :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sm :set splitbelow<CR>:split<CR>


map <LEADER>j <C-w>h
map <LEADER>h <C-w>w
map <LEADER>k <C-w>k
map <LEADER>m <C-w>j
map <LEADER>l <C-w>l

map <down> :res +5<CR>
map <up> :res -5<CR>
map <right> :vertical resize-5<CR>
map <left> :vertical resize+5<CR>
map tu :tabe<CR>
map tj :-tabnext<CR>
map tl :+abnext<CR>

map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K


" Call figlet
map tx :r !figlet 
map <LEADER>sv :source $MYVIMRC<CR>
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'vim-airline/vim-airline-themes'
" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }
" Taglist
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

Plug 'ycm-core/YouCompleteMe'


call plug#end()
set mouse=a
color snazzy
let g:SnazzyTransparent = 1

" ===
" === NERDTree
" ===
map tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
"let NERDTreeMapUpdir = "m"
""let NERDTreeMapUpdirKeepOpen = "l"
"let NERDTreeMapOpenSplit = ""
"let NERDTreeOpenVSplit = ""
"let NERDTreeMapActivateNode = "i"
"" let NERDTreeMapOpenInTab = "o"
"let NERDTreeMapPreview = "k"
let NERDTreeMapJumpFirstChild = "k"
let NERDTreeMapJumpLastChild = "h"
let NERDTreeMapJumpPrevSibling = "<c-k>"
let NERDTreeMapJumpLastChild = "<C-h>"
"let NERDTreeMapCloseDir = "n"
"let NERDTreeMapChangeRoot = "y"

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" ===
" === You Complete ME
" ===
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap g/ :YcmCompleter GetDoc<CR>
nnoremap gt :YcmCompleter GetType<CR>
nnoremap gr :YcmCompleter GoToReferences<CR>
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_use_clangd = 0
"let g:ycm_python_binary_path = g:ycm_python_interpreter_path
let g:ycm_python_interpreter_path = system('which python3')
"let g:ycm_python_binary_path = system('which python3')
"let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']


" ===
" === Taglist
" ===
map <silent> T :TagbarOpenAutoClose<CR>



