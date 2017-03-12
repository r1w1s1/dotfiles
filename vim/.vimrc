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
autocmd BufEnter * EnableStripWhitespaceOnSave
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
