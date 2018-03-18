execute pathogen#infect()
syntax on
filetype plugin indent on
set cm=blowfish
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
map ic :s/^/#/g<CR>:let @/ = ""<CR>
map rc :s/^#//g<CR>:let @/ = ""<CR>
set ttimeoutlen=5
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
set nocompatible
set nobackup
set noswapfile                                                                                                                                       
set noundofile  
filetype plugin on
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
