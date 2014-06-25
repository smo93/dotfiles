set nocompatible              " be iMproved, required
filetype off
syntax enable
set number
set cursorline
set backspace=indent,eol,start

" call pathogen#helptags()
" call pathogen#incubate()

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Bundle 'scrooloose/nerdtree'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/syntastic'
Bundle 'Valloric/YouCompleteMe'
Bundle 'bling/vim-airline'
Bundle 'marijnh/tern_for_vim'

call vundle#end()            " required
filetype plugin on


imap <C-c> <CR><Esc>O

let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview


autocmd FileType html set omnifunc=htmlcomplete#CompleteTags


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
" set background=dark
set wildmenu
set colorcolumn=80
set nowrap
colorscheme molokai

" split navigation
nnoremap <C-Down> <C-w><C-J>
nnoremap <C-Up> <C-w><C-K>
nnoremap <C-Right> <C-w><C-L>
nnoremap <C-Left> <C-w><C-H>

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
let g:airline_left_sep='⮀'
let g:airline_right_sep='⮂'

