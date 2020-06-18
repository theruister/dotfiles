
" set ctrl-f to toggle NERDTree pane 
:nnoremap <C-f> :NERDTreeToggle<CR>
" exit vim if you are clossing everything but the NERDTree pane
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd BufEnter * lcd %:p:h

set tabstop=4 softtabstop=4
set noerrorbells
set shiftwidth=4
set expandtab
set textwidth=120
syntax on
set t_Co=256
set number relativenumber
set cursorline
set lazyredraw 
set showmatch
set smartcase

set noruler
set laststatus=2
set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"

" govim setup
set nocompatible
set nobackup
set nowritebackup
set noswapfile

filetype plugin indent on
set backspace=indent,eol,start


set autoindent
" set smartindent
filetype indent on

set undodir=~/.vim/undodir
set undofile

set incsearch


call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf'
Plug 'ycm-core/YouCompleteMe'
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
" Plug 'leafgarland/typescript-vim'
" Plug 'vim-utils/vim-man'
" Plug 'lyuts/vim-rtags'
" Plug 'mbbill/undotree'
call plug#end()

colorscheme gruvbox
set background=dark

set runtimepath^=~/.vim/bundle/ctrlp.vim

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader = " "

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:ctrlp_use_caching = 0
let g:ctrlp_working_path_mode = 'ra'

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

fun! GoYCM()
    nnoremap <buffer> <silent> <leader>gd :YcmCompleter GoTo<CR>
    nnoremap <buffer> <silent> <leader>gr :YcmCompleter GoToReferences<CR>
    nnoremap <buffer> <silent> <leader>rr :YcmCompleter RefactorRename<space>
endfun

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

