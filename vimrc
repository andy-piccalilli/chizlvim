" Vundle start
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Define plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-syntastic/syntastic' 
Plugin 'sheerun/vim-polyglot'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/nerdtree'

" Vundle end 
call vundle#end()
filetype plugin indent on

" Set color scheme
colorscheme Tomorrow-Night

" Set core editor settings
set number
set nowrap
set showbreak=+++
set textwidth=0
set showmatch
set visualbell
set hlsearch
set smartcase
set ignorecase
set incsearch
set autoindent
set smartindent
set smarttab
set ruler
set undolevels=1000
set backspace=indent,eol,start

" Set tab settings
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Set syntastic settings
syntax on
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_tidy_quiet_messages = { 'level': 'warnings' }

" Set vim-jsx settings
let g:jsx_ext_required = 0

" Set UltiSnips settings
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<c-b>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsSnippetDirectories=['UltiSnips']

" Set autocomplete and filetype settings
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Syntax overrides

" Prevent underlines in markup
let html_no_rendering=1

" Prevent comment chars been added on new line creation
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" When a curly brace pair is added, add a new tabbed line inside them
inoremap {<CR> {<CR>}<Esc>O<BS><Tab>

" Keymappings 
map <C-b> :NERDTreeToggle<CR>
