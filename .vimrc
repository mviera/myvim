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

" General config
set nocompatible
filetype plugin on

" Pencil config
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
