" TODO: LOOK AT WINDOWS PLUGINS FOR MORE INFORMATION (JSHINT)
" put this line first in ~/.vimrc

" === VUNDLE ===
set nocompatible
filetype off
set rtp+=X:\Dropbox\Public\configs\vim\.vim\bundle\Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tcomment_vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'vim-scripts/renamer.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'SirVer/ultisnips'
Plugin 'jaxbot/browserlink.vim'
Plugin 'idbrii/AsyncCommand'
" Breaks ^X mode
" Plugin 'vim-scripts/vim-auto-save'
Plugin 'elzr/vim-json'
Plugin 'morhetz/gruvbox'
call vundle#end()
" ==== VUNDLE END ===

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
set encoding=utf-8
" Otherwise there is a warning of trailing characters
" in the bottom left corner
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme = 'powerlineish'
" === VIM-AIRLINE SETTINGS : END ===

" === COLORSCHEME SPECIFIC SETTINGS AND FUNCTIONS ===
colorscheme  molokai
function! Colorscheme(colorscheme, background_color, airline_theme)
    execute "colorscheme " . a:colorscheme
    execute "set background=". a:background_color
    execute "AirlineTheme " . a:airline_theme
endfunction
function! ToggleColorscheme()
    if g:colors_name == "molokai"
        call Colorscheme("gruvbox", "light", "gruvbox")
    else
        call Colorscheme("molokai", "dark", "powerlineish")
    endif
endfunction
" === END : COLORSCHEME SPECIFIC SETTINGS AND FUNCTIONS ===

set nowrap
set incsearch
set textwidth=80
" MAPS AND CABBREVS

cabbrev h2v windo wincmd H
cabbrev v2h windo wincmd K
cabbrev ! AsyncCommand
cabbrev tc :call ToggleColorscheme()<CR>

iabbrev arw ->
iabbrev eq =

function! DiscourageEscape()
    echom "DON'T USE DON'T USE DON'T USE DON'T USE DON'T USE DON'T USE DON'T USE DON'T USE "
    stopinsert
endfunction

" For exiting INSERT mode 
inoremap jk 
inoremap  <C-o>:call DiscourageEscape()<CR>

noremap j h
noremap k j
noremap l k
noremap ; l

" Faster scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Same as let mapleader = " " but space shows in showcmd
map <space> <Leader>
" let mapleader = " "

nnoremap <Leader>s :bn<CR>
nnoremap <Leader>a :bp<CR>
nnoremap <Leader>d :bd<CR>

nnoremap <Leader>j <C-W>h
nnoremap <Leader>k <C-W>j
nnoremap <Leader>l <C-W>k
nnoremap <Leader>; <C-W>l
nnoremap <Leader>o <C-W>o
nnoremap <Leader>c <C-W>c
nnoremap <Leader>x <C-W>x

nnoremap <Leader>w :w<CR>
nnoremap <Leader>e :e#<CR>

nnoremap <Leader>h :cd %:h<CR>

nnoremap <Leader><space> :

nnoremap <Leader>q :set nohls!<CR>

nnoremap <Leader>t :NERDTreeToggle<CR>
nnoremap <Leader>m :CtrlPMRU<CR>

" Move visual block
vnoremap K :m '>+1<CR>gv=gv
vnoremap L :m '<-2<CR>gv=gv

" Keeps searches on center of the screen
nnoremap n nzz
nnoremap N Nzz

" Use Arrow Keys to resize windows
noremap <up>    <C-W>+
noremap <down>  <C-W>-
noremap <left>  3<C-W><
noremap <right> 3<C-W>>

nnoremap hh ;
nnoremap hn :AsyncCommand START "Flashcard Server" node X:\Dropbox\js\spanish\bin\www<CR>
nnoremap hs :AsyncCommand C:\HOME\vimfiles\bundle\browserlink.vim\browserlink\start.bat<CR>
nnoremap ho :call MakeSpace('below')<CR>
nnoremap hO :call MakeSpace('above')<CR>
nnoremap h; ;

syntax on
set number
" Sauce - http://www.vex.net/~x/python_and_vim.html
set smartindent
" Automatically indents when and where required
set tabstop=4
" Sets tab width to 4 (Prefered for Python)
set shiftwidth=4
" Allows you to use < and > keys in -- VISUAL -- mode for indenting
" and unindenting 
set expandtab
" Inserts 4 spaces when <TAB> is pressed
set softtabstop=4
" Makes vim see four spaces as a <TAB>
set relativenumber
" Sets relative line numbers
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
" FILE SPECIFIC SETTINGS
au BufRead,BufNewFile *.md set filetype=markdown
" FILE SPECIFIC SETTINGS BASH
au BufRead,BufNewFile *.bash* set filetype=sh
" Sets syntax highlighting for bash_aliases and histor

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
    set columns=84
    " GUI Font
    " Changed from vanilla consolas to display arrows in vim-airline
    set guifont=Powerline_Consolas:h11:cANSI
    " JSLint Setup
    let g:syntastic_javascript_jshint_exec = 'C:\Program Files\JSLint\jsl-0.3.0\jsl.exe'
    let g:syntastic_javascript_checkers = ['jsl']
    "JSONLint setup
    let g:syntastic_json_checkers=['jsonlint']
endif

" PATH VARIABLES
let $dropbox = 'X:\Dropbox'

if has("unix")
    let $dropbox = '/media/sf_Dropbox'
endif

let $vimrc = $dropbox . '\Public\configs\vim\.vimrc'
let $haskell = $dropbox . '\haskell'
let $configs = $dropbox . '\Public\configs'
let $vimsnips = $configs . '\vim\.vim\vim-addons\vim-snippets\snippets'
let $spanish = $dropbox . '\js\spanish'
let $vimsnips = $configs . '\vim\.vim\vim-addons\vim-snippets\snippets'
let $jsnips = $configs . '\vim\.vim\vim-addons\vim-snippets\snippets\javascript'
let $desktop = 'C:\Users\Toshiba PC\Desktop'
" This is neccessary for plugins that use python
" If this is not set then plugins such as UltiSnips and BrowserLink
" will crash whenever they are called
" In the case of UltiSnips it is during <TAB>
" In the case of BrowserLink it is when we open an HTML, CSS or JS file
let $pythonhome = 'C:\Python27'

if has("win32")
    source $dropbox\vimscripts\insert_three_lines_and_start_in_middle_plugin.vim
    source $dropbox\vimscripts\environment_variable_converter.vim
endif
if has("unix")
    "PATH VARIABLES
    let $haskell = ConvertWin32ToUnix($haskell)
    let $configs = ConvertWin32ToUnix($configs)
    let $vimsnips = ConvertWin32ToUnix($vimsnips)
    " COLORSCHEME MOLOKAI SETTINGS
    " Sets color of lineno columns same as molokai background
    hi LineNr ctermbg = 235
    " All Lines Without Text (New File) now have same color as lines with text
    hi NonText ctermbg = 235
endif

if has("unix")
    source $dropbox/vimscripts/header_plugin.vim
    source $dropbox/vimscripts/toggle_plugin.vim
    source $dropbox/vimscripts/install_plugin.vim
    source $dropbox/vimscripts/insert_three_lines_and_start_in_middle_plugin.vim
endif

function! B()
    let @a=""
    :g/Leader>/y A
    exec 'edit' '~/Leader'
    normal! ggdG
    normal! "ap
    :g/"/d
    :%s/\(.*>\)\(.\)\(.*\)/\2
    :g/^ *$/d
    :sort i
endfunction
