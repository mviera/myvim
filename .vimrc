" Plugins list.
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
Plug 'junegunn/goyo.vim'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-colors-pencil'
Plug 'mattly/iterm-colors-pencil'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'honza/vim-snippets'
Plug 'rodjek/vim-puppet'
" Add plugins to &runtimepath
call plug#end()

"
" GENERAL CONFIG
"
set number
set nocompatible
filetype plugin on
set autoindent " always set autoindenting on
set backupcopy=yes " Keep a backup file
set viminfo='20,\"50 " read/write a .viminfo file, don't store more than 50
set history=100 " keep 50 lines of command line history
set ruler " show the cursor position all the time
set expandtab
set tabstop=2
set listchars=tab:>.,trail:-,extends:>,precedes:<
set list
set encoding=utf-8
set shiftwidth=2

" Set leader to comma.
let mapleader = ","
let maplocalleader = ","

" Don't redraw screen while executing macros.
set nolazyredraw

" Flexible backspace: allow backspacing over autoindent, line breaks, start of insert.
set backspace=indent,eol,start

" Set title of window according to filename.
set title

" Break line at 80 chars
set tw=90

" Search
set hlsearch       " highlight matches
set incsearch      " incremental searching
set ignorecase     " searches are case insensitive...
set smartcase      " ... unless they contain at least one capital letter


"
" PLUGINS CONFIG.
"
" Pencil
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
                            \ | call lexical#init()
                            \ | call litecorrect#init()
                            \ | call textobj#quote#init()
                            \ | call textobj#sentence#init()
augroup END

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init({'wrap': 'soft'})
augroup END

let g:pencil#joinspaces = 0     " 0=one_space (def), 1=two_spaces
let g:pencil#conceallevel = 3     " 0=disable, 1=onechar, 2=hidechar, 3=hideall (def)
let g:pencil#concealcursor = 'c'  " n=normal, v=visual, i=insert, c=command (def)

let g:pencil_neutral_headings = 1   " 0=blue (def), 1=normal
let g:pencil_neutral_code_bg = 1   " 0=gray (def), 1=normal
let g:pencil_terminal_italics = 1
let g:airline_theme = 'pencil'

" gitgutter config
set updatetime=250
let g:gitgutter_max_signs = 500  " default value

" airlines preferences
set t_Co=256
set laststatus=2  " always show the status bar
let g:airline_enable_syntastic=1
let g:airline_powerline_fonts=1
" unicode symbols
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_linecolumn_prefix = '␤ '
let g:airline_fugitive_prefix = '⎇ '
let g:airline_paste_symbol = 'ρ'
let g:airline_readonly_symbol = '✗'
