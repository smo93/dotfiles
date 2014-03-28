set nocompatible              " be iMproved, required
filetype indent plugin on
syntax enable
set number

call pathogen#helptags()
call pathogen#incubate()

let mapleader=","
let maplocalleader=","
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
autocmd FileType python    nnoremap <buffer> <localleader>c I#<esc>

set hidden " hides buffer instead of closing them

set t_Co=256

set autoindent
set copyindent " copy the prev indentation on autoindenting
set showmatch " set show matching parenthesis
set smartcase " ignore case if search pattern is all lowercase, case-sensitive otherwise
set incsearch     " show search matches as you type
set title " change terminal title

set nobackup
set noswapfile

set pastetoggle=<F2>

set mouse=a

set list
set listchars=tab:..,trail:.,extends:#,nbsp:.

set tabstop=4
set shiftwidth=4
set shiftround " use multiple of shiftwidth when indenting with '<' and '>'
set expandtab
set smarttab
set background=dark
set wildmenu
set colorcolumn=80
set nowrap
colorscheme molokai

" split navigation
nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-Left> <C-W><C-H>
" some more split navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
" buffer navigation
nmap <silent> <A-Left> :bprevious<CR>
nmap <silent> <A-Right> :bnext<CR>
nmap <silent> <A-Down> :bdelete<CR>
nmap <silent> <A-h> :bprevious<CR>
nmap <silent> <A-l> :bnext<CR>
nmap <silent> <A-j> :bdelete<CR>

noremap <silent> <F3> :NERDTreeToggle<CR>

map <Leader>j i<CR><Esc>

set langmap =Ч~,ЯQ,ВW,ЕE,РR,ТT,ЪY,УU,ИI,ОO,ПP,Ш{,Щ},АA,СS,ДD,ФF,ГG,ХH,ЙJ,КK,ЛL,ЗZ,ЬZ,ЦC,ЖV,БB,НN,МM,ч`,яq,вw,еe,рr,тt,ъy,уu,иi,оo,пp,ш[,щ],аa,сs,дd,фf,гg,хh,йj,кk,лl,зz,ьz,цc,жv,бb,нn,мm,ю\\,Ю\|,

inoremap jk <esc>

nnoremap ; :

nnoremap j gj
nnoremap k gk

set splitright

"""""""""""
" AirLine "
"""""""""""
let g:airline#extensions#tabline#enabled = 1
set ttimeoutlen=50
let g:airline_theme='powerlineish'
set laststatus=2

