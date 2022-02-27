call plug#begin('~/.vim/plugged')
    Plug 'scrooloose/nerdtree',{ 'on': 'NERDTreeToggle' }
    Plug 'jiangmiao/auto-pairs'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'easymotion/vim-easymotion'
    Plug 'pbrisbin/vim-colors-off'
    Plug 'morhetz/gruvbox'

    "Plug 'rhysd/vim-clang-format'
call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme off
set background=dark
highlight ColorColumn ctermbg=darkgray
set number relativenumber

"colorscheme gruvbox
"set background=light
"set number
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4
set smarttab
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=99
set title
set colorcolumn=150

set ruler
set cursorline
autocmd InsertEnter,InsertLeave * set cursorline!

set nohlsearch
set incsearch
set ignorecase

set encoding=utf8
set fileencodings=utf-8,cp1251,koi8-r,cp866

set mousehide
set textwidth=100
set wrapmargin=0
set formatoptions+=t

set updatetime=2000
set autoread
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * checktime

let &t_SI = "\<Esc>[6 q"
let &t_EI = "\<Esc>[2 q"
let &t_SR = "\<Esc>[4 q"

set ttyfast
set whichwrap+=<,>,h,l,[,]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = ","
map <leader> <Plug>(easymotion-prefix)
nmap f <Plug>(easymotion-overwin-f)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

map <C-N> : NERDTreeToggle<CR>
map <C-j> : bn <CR>
map <C-k> : bp <CR>
map <C-h> : bd <CR>
map <leader>m :!make <CR>

nnoremap Y y$

map j gj
map k gk

map <leader>ll :w <CR>
"autocmd FileType javascript,c,cpp,objc map <leader>ll :ClangFormat <CR> :w <CR>
"autocmd FileType javascript,c,cpp,objc nnoremap <buffer><Leader>f :<C-u>ClangFormat<CR>
"autocmd FileType javascript,cpp,objc vnoremap <buffer><Leader>f :ClangFormat<CR>
"autocmd FileType c,cpp,objc ClangFormatAutoToggle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"autoclose for nerdtree when vim closed
autocmd BufEnter *
      \ if (winnr("$") == 1
      \ && exists("b:NERDTree")
      \ && b:NERDTree.isTabTree())
      \ | q | endif

"clear spaces and clear lines
autocmd BufWritePre * call CleanupBeforeWrite()
function! CleanupBeforeWrite()

    " Запоминаем позицию курсора
    let l:line = line('.')
    let l:col = col('.')

    " Убрать лишние пробелы на концах строк
    " % перед s означает, что нужно сразу во всём файле заменять
    :%s/\s\+$//e

    " Добавить пустые строки под конец файла
    " (нужно, чтобы правильно их усечь до одной впоследствии)
    ":$s/$/\=repeat("\r", 5)/e

    " Убрать лишние пустые строки в избыточном количестве
    :%s/\n\{5,}/\r\r/e

    " Странно, но при замене \r - это newline,
    " а \n - это null.
    " https://stackoverflow.com/questions/3965883/vim-replace-character-to-n
    " https://unix.stackexchange.com/questions/247329/vim-how-to-replace-one-new-line-n-with-two-ns

    " Оставляем только одну пустую строку под конец файла
"    :$-1,$s/\n//e

    " Возвращаем курсор в исходное положение
    call cursor(l:line, l:col)

endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:clang_format#style_options = {
"            \ "BasedOnStyle" : "Google",
"            \ "FixNamespaceComments" : "false",
"            \ "ColumnLimit" : 150,
"            \ "UseTab" : "Never",
"            \ "SpaceAfterTemplateKeyword" : "false",
"            \ "SpaceAfterCStyleCast" : "true",
"            \ "AlignConsecutiveAssignments" : "true",
"            \ "AlignTrailingComments" : "true",
"            \ "AllowShortLambdasOnASingleLine" : "false",
"            \ "AllowShortFunctionsOnASingleLine" : "false"}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
