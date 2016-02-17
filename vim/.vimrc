set nocompatible
filetype off
if has("win32")
    set rtp+=X:\Dropbox\Public\configs\vim\.vim\bundle\Vundle.vim
endif
if has("unix")
    set rtp+=/media/common/Dropbox/Public/configs/vim/.vim/bundle/Vundle.vim
    set rtp+=X:/Dropbox/Public/configs/vim/.vim/bundle/Vundle.vim
endif
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tcomment_vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'kien/ctrlp.vim'          

Plugin 'vim-scripts/renamer.vim' 
Plugin 'SirVer/ultisnips'        
Plugin 'godlygeek/tabular'       

Plugin 'jaxbot/browserlink.vim'
Plugin 'vim-scripts/vim-auto-save'
Plugin 'elzr/vim-json'

Plugin 'Raimondi/delimitMate'
Plugin 'tommcdo/vim-exchange'

Plugin 'kana/vim-textobj-user'
Plugin 'glts/vim-textobj-comment'
Plugin 'wellle/targets.vim'

Plugin 'terryma/vim-multiple-cursors'
Plugin 'justinmk/vim-sneak'
Plugin 'othree/eregex.vim'
Plugin 'zirrostig/vim-schlepp'
call vundle#end()

set nocompatible | filetype indent plugin on | syn on 
" === VIM-AIRLINE SETTINGS : START ===
"URL = http://www.4thinker.com/vim-airline.html
" Necessary for vim-ariline to show in normal window
" Otherwise it shows only when we do a split
set laststatus=2
" Shows buffers in tab
" Tabline works when only single tab
let g:airline#extensions#tabline#enabled = 1
" Need to add thesee two to display glyphs properly in vim-airline
let g:airline_powerline_fonts = 1
if has("nvim") == 0
    set encoding=utf-8
endif
" Otherwise there is a warning of trailing characters
" in the bottom left corner
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme = 'powerlineish'
" === VIM-AIRLINE SETTINGS : END ===

" temp fix - https://github.com/907th/vim-auto-save/issues/18#issuecomment-145367360
let g:auto_save_in_insert_mode = 0


let g:UltiSnipsJumpForwardTrigger = "<C-k>"
let g:UltiSnipsJumpBackwardTrigger = "<C-l>"

let delimitMate_expand_cr = 1
let delimitMate_expand_space=1
let delimitMate_jump_expansion = 1

if has("win32")
    source $HOME\vimfiles\autoload\pathConverter.vim
    source $HOME\vimfiles\autoload\showLeader.vim
    source $HOME\vimfiles\autoload\header_plugin.vim
    source $HOME\vimfiles\autoload\toggle_plugin.vim
    source $HOME\vimfiles\autoload\makeSpace.vim
    source $HOME\vimfiles\autoload\mdToCode.vim
    source $HOME\vimfiles\autoload\vMove.vim
    source $HOME\vimfiles\autoload\noEsc.vim
    source $HOME\vimfiles\autoload\toggleColor.vim
endif
if has("unix")
    source $HOME/.vim/autoload/pathConverter.vim
    source $HOME/.vim/autoload/showLeader.vim
    source $HOME/.vim/autoload/header_plugin.vim
    source $HOME/.vim/autoload/toggle_plugin.vim
    source $HOME/.vim/autoload/makeSpace.vim
    source $HOME/.vim/autoload/mdToCode.vim
    source $HOME/.vim/autoload/vMove.vim
    source $HOME/.vim/autoload/noEsc.vim
    source $HOME/.vim/autoload/toggleColor.vim
endif
colorscheme  molokai
"
" To make CTRL-A work on 07
set nrformats-=octal

set ignorecase  smartcase  
set nohlsearch incsearch

set autochdir
set nowrap
set textwidth=80

if has("nvim")
    function! HorizontalTerminal()
        sp
        term
    endfunction
    cabbrev sterm :call HorizontalTerminal()
    function! VerticalTerminal()
        vs
        term
    endfunction
    cabbrev vterm :call VerticalTerminal()
endif

if has("nvim")
    tnoremap jk  <C-\><C-n>
    tnoremap <Esc> <C-\><C-n>
    tnoremap <C-w>j <C-\><C-n><C-w>h
    tnoremap <C-w>k <C-\><C-n><C-w>j
    tnoremap <C-w>l <C-\><C-n><C-w>k
    tnoremap <C-w>; <C-\><C-n><C-w>l
    tnoremap <C-w><C-w> <C-\><C-n><C-w><C-w>
endif
" noremap  
inoremap jk 
vnoremap jk 

" https://www.reddit.com/r/vim/comments/3n97ug/its_been_a_long_while_since_ive_discovered/cvm0y66
inoremap <expr> <c-y> pumvisible() ? "\<c-y>" : matchstr(getline(line('.')-1), '\%' . virtcol('.') . 'v\%(\k\+\\|.\)')
inoremap <expr> <c-e> pumvisible() ? "\<c-e>" : matchstr(getline(line('.')+1), '\%' . virtcol('.') . 'v\%(\k\+\\|.\)')

noremap j h
noremap k gj
noremap l gk
noremap ; l

noremap gk gj
noremap gl gk

nnoremap <C-w>j <C-w>h
nnoremap <C-w>k <C-w>j
nnoremap <C-w>l <C-w>k
nnoremap <C-w>; <C-w>l

nnoremap <C-w>J <C-w>H
nnoremap <C-w>K <C-w>J
nnoremap <C-w>L <C-w>K
nnoremap <C-w>: <C-w>L

" Same as let mapleader = " " but space shows in showcmd
" map <space> <Leader>
" let mapleader = " "
" nnoremap <Leader><space> :

nnoremap cm :CtrlPMRUFiles<CR>

nnoremap <C-TAB> :bn<CR>
nnoremap <C-S-TAB> :bp<CR>

syntax on
set number
" Automatically indents when and where required
set smartindent
" Sets tab width to 4 
set tabstop=4
" Allows you to use < and > keys in -- VISUAL --
set shiftwidth=4
" Inserts 4 spaces when <TAB> is pressed
set expandtab
" Makes vim see four spaces as a <TAB>
set softtabstop=4
" Sets relative line numbers
set relativenumber
" Fixes backspace inside insert mode
set backspace=indent,eol,start
" Splits properly
set splitright

if has("unix")
    set backupdir=~/.vim/vimtmp,.
    set directory=~/.vim/vimtmp,.
endif
if has("win32")
    set backupdir=~\vimfiles\vimtmp,.
    set directory=~\vimfiles\vimtmp,.
endif

au BufRead,BufNewFile *.md set filetype=markdown
" Sets syntax highlighting for bash_aliases and histor
au BufRead,BufNewFile *.bash* set filetype=sh

if has("win32")
    " GUI OPTIONS
    " Removes right-scrollbar(r) 
    " Removes menu(T) 
    " Removes left-scrollbar (L)
    " Removes above menubar (m)
    set guioptions-=r
    set guioptions-=T
    set guioptions-=L
    set guioptions-=m
    " Disables annoying bells in gvim
    set noeb vb t_vb=
    " Disables flashing
    autocmd GUIEnter * set visualbell t_vb=
    " Sets initial vim window size
    " set columns=84
    " GUI Font
    " Changed from vanilla consolas to display arrows in vim-airline
    set guifont=Powerline_Consolas:h11:cANSI
    " JSLint Setup
    let g:syntastic_javascript_jshint_exec = 'C:\Program Files\JSLint\jsl-0.3.0\jsl.exe'
    let g:syntastic_javascript_checkers = ['jsl']
    "JSONLint setup
    let g:syntastic_json_checkers=['jsonlint']
endif

let $dropbox = 'X:\Dropbox'
if has("unix")
    let $dropbox = '/media/common/Dropbox'
endif
let $vimrc = $dropbox . '\Public\configs\vim\.vimrc'
let $haskell = $dropbox . '\haskell'
let $configs = $dropbox . '\Public\configs\vim'
let $vimsnips = $configs . '\vim\.vim\vim-addons\vim-snippets\snippets'
let $spanish = $dropbox . '\js\spanish'
let $desktop = 'C:\Users\Toshiba PC\Desktop'
" Necessary for plugins requiring python
let $pythonhome = 'C:\Python27'
if has("unix")
    let $vimrc = ConvertWin32ToUnix($vimrc)
    let $haskell = ConvertWin32ToUnix($haskell)
    let $configs = ConvertWin32ToUnix($configs)
    let $vimsnips = ConvertWin32ToUnix($vimsnips)
    let $spanish = ConvertWin32ToUnix($spanish)
    let $shell_scripts = $dropbox . '/sh'
endif

if has("nvim")
    " Prevents terminal buffer from being deleted once it's window closes
    autocmd TermOpen * set hidden
endif

function! PasteHere()
    silent! set paste
    silent! normal! "+P
    silent! set nopaste
endfunction

command! PasteHere :call PasteHere()

function! MakeNumberedListInLastVisualSelection()
    silent! '<,'>s/ - /\=line('.')-line("'<")+1
    silent! %s/(\d\)\./0\1 
endfunction

command! NumberBuffer call MakeNumberedListInLastVisualSelection()

nnoremap cd :silent! :!cmd .<CR>

function! OneLineDown ()
    .put=''
endfunction

function! OneLineUp ()
    .-1put=''
endfunction

nnoremap  :call OneLineDown ()<CR>
nnoremap  :call OneLineUp ()<CR>

if !exists("*AddNewPlugin")
    function! AddNewPlugin ()
        ?^Plugin
        .t.
        normal! wdi'"+P
        write
        source %
        PluginInstall
    endfunction
    command! AddNewPlugin call AddNewPlugin()
endif

let g:multi_cursor_exit_from_insert_mode = 0
let g:eregex_default_enable = 0

nnoremap g/ :1M/

noremap h "+

nnoremap , ;
nnoremap c, ,

vmap K <Plug>SchleppIndentDown
vmap L <Plug>SchleppIndentUp

vmap <Left> <Plug>SchleppLeft
vmap <Right> <Plug>SchleppRight

function! DuplicateAndComment ()
    silent! '<,'>t'>
    silent! '<,'>TComment
endfunction

vmap gy :call DuplicateAndComment ()<CR>
nnoremap <BS> :set hls!<CR>

nmap s <Plug>(SneakStreak)
nmap S <Plug>(SneakStreakBackward)
vmap s <Plug>(SneakStreak)

cnoremap <C-l> <Up>
cnoremap <C-k> <Down>
