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
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/nerdcommenter'
Plugin 'yegappan/mru'
Plugin 'Yggdroot/indentLine'
Plugin 'chrisbra/Colorizer'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'prettier/vim-prettier'
Plugin 'sumpygump/php-documentor-vim'
Plugin 'cakebaker/scss-syntax.vim'

" Vundle end 
call vundle#end()
filetype plugin indent on

" Set color scheme
colorscheme ChizlPanda

" Airline theme
let g:airline_theme='monochrome'

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
let g:syntastic_javascript_checkers=['eslint']

" Set vim-jsx settings
let g:jsx_ext_required = 0
highlight link xmlEndTag xmlTag

" JS setting 
let g:javascript_plugin_jsdoc = 1

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

" Set syntastic to passive mode for html. Shortcut ctrl+w E will make it active: https://stackoverflow.com/a/21434697/2219969
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [],'passive_filetypes': ['html'] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

" Set HTML syntax for odd filetypes
autocmd BufNewFile,BufRead *.html.twig   set syntax=htmldjango
autocmd BufNewFile,BufRead *.njk   set syntax=htmldjango
autocmd BufNewFile,BufRead *.html   set syntax=htmldjango

" Keymappings

" Toggle NERDTree
map <C-b> :NERDTreeToggle<CR>

" Run Tabular align function. After you need to provide the separator such as = or : or =>
map <C-a> :Tab /

" Show most recently opened/edited files
map <C-m> :MRU<CR>

" Highlight document colors 
map <C-h> :ColorHighlight<CR>

" Add a JS Doc
map <C-j> :JsDoc<CR>

" Add a PHP doc
au BufRead,BufNewFile *.php inoremap <buffer> <C-j> :call PhpDoc()<CR>
au BufRead,BufNewFile *.php nnoremap <buffer> <C-j> :call PhpDoc()<CR>
au BufRead,BufNewFile *.php vnoremap <buffer> <C-j> :call PhpDocRange()<CR>

" NERDCommenter 
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

" CtrlP settings
set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Prettier settings
let g:prettier#config#tab_width = 4

" Tweak clipboard 
:set clipboard=unnamed

" Enable omnicomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set completeopt-=preview

" Show which color scheme settings the highlighted character/word is using 
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
