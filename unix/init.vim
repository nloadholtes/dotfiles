filetype plugin indent on
syntax enable
colorscheme slate
au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/yaml.vim
set paste 
set number
set ls=2
set tabstop=4

highlight Comment ctermfg=yellow
highlight String ctermfg=2

hi User1 guifg=#eea040 guibg=#222222
hi User2 guifg=#dd3333 guibg=#222222
hi User3 guifg=#ff66ff guibg=#222222
hi User4 guifg=#a0ee40 guibg=#222222
hi User5 guifg=#eeee40 guibg=#222222

set statusline +=%1*\ %n\ %*            "buffer number
" set statusline +=%5*%{&ff}%*            "file format
" set statusline +=%3*%y%*                "file type
set statusline +=%2*\ %f%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%3*%4v\ %*             "virtual column number
set statusline +=%5*0x%04B\ %*          "character under cursor

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
call plug#begin('~/.local/share/nvim/plugged')

" List of plugins
" ...
Plug 'mustache/vim-mustache-handlebars'

" Initialize plugin system
call plug#end()

