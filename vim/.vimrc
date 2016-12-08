set nocompatible
filetype off
if has("win32")
    set rtp+=X:\Dropbox\Public\configs\vim\.vim\bundle\Vundle.vim
endif
if has("unix")
    set rtp+=/mnt/x/Dropbox/Public/configs/vim/.vim/bundle/Vundle.vim
    set rtp+=X:/Dropbox/Public/configs/vim/.vim/bundle/Vundle.vim
endif
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'prendradjaja/vim-vertigo'
" Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'kien/ctrlp.vim'          

Plugin 'vim-scripts/renamer.vim' 
" Plugin 'SirVer/ultisnips'        
Plugin 'godlygeek/tabular'       

Plugin 'Raimondi/delimitMate'
Plugin 'tommcdo/vim-exchange'

Plugin 'kana/vim-textobj-user'
Plugin 'glts/vim-textobj-comment'
Plugin 'wellle/targets.vim'

Plugin 'terryma/vim-multiple-cursors'
Plugin 'justinmk/vim-sneak'
" Plugin 'othree/eregex.vim'
Plugin 'zirrostig/vim-schlepp'
" Plugin 'junegunn/vim-easy-align'
Plugin 'osyo-manga/vim-over'
Plugin 'bps/vim-textobj-python'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'coderifous/textobj-word-column.vim'
Plugin 'tmhedberg/matchit'
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

let g:multi_cursor_exit_from_insert_mode = 0
let g:eregex_default_enable = 0

" To prevent map conflict with textobj-column
let g:textobj_comment_no_default_key_mappings = 1
xmap ax <Plug>(textobj-comment-a)
omap ax <Plug>(textobj-comment-a)

xmap ix <Plug>(textobj-comment-i)
omap ix <Plug>(textobj-comment-i)

xmap aX <Plug>(textobj-comment-big-a)
omap aX <Plug>(textobj-comment-big-a)

if has("win32")
    source $HOME\vimfiles\autoload\pathConverter.vim
endif

if has("unix")
    source $HOME/.vim/autoload/pathConverter.vim
endif

colorscheme  molokai

let $dropbox = 'X:\Dropbox'
if has("unix")
    let $dropbox = '/mnt/x/Dropbox'
endif
let $vimrc = $dropbox . '\Public\configs\vim\.vimrc'
let $haskell = $dropbox . '\haskell'
let $configs = $dropbox . '\Public\configs\vim'
let $commonvimrc = $configs . '\.commonvimrc'
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
    let $commonvimrc = ConvertWin32ToUnix($commonvimrc)
endif

if has("unix")
    set backupdir=~/.vim/vimtmp,.
    set directory=~/.vim/vimtmp,.
endif
if has("win32")
    set backupdir=~\vimfiles\vimtmp,.
    set directory=~\vimfiles\vimtmp,.
endif

if has("nvim")
    " Prevents terminal buffer from being deleted once it's window closes
    autocmd TermOpen * set hidden
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
xnoremap jk 

" https://www.reddit.com/r/vim/comments/3n97ug/its_been_a_long_while_since_ive_discovered/cvm0y66
inoremap <expr> <c-y> pumvisible() ? "\<c-y>" : matchstr(getline(line('.')-1), '\%' . virtcol('.') . 'v\%(\k\+\\|.\)')
inoremap <expr> <c-e> pumvisible() ? "\<c-e>" : matchstr(getline(line('.')+1), '\%' . virtcol('.') . 'v\%(\k\+\\|.\)')

nnoremap j h
nnoremap k gj
nnoremap l gk
nnoremap ; l

onoremap j h
onoremap k j
onoremap l k
onoremap ; l

xnoremap j h
xnoremap k gj
xnoremap l gk
xnoremap ; l

nnoremap gk gj
nnoremap gl gk
onoremap gk gj
onoremap gl gk
xnoremap gk gj
xnoremap gl gk

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

nnoremap <S-Tab> <C-o>

nnoremap <C-TAB> :bn<CR>
nnoremap <C-S-TAB> :bp<CR>

nnoremap cd :silent! :!cmd .<CR>
nnoremap g/ :1M/

nnoremap h "+
xnoremap h "+

nnoremap , ;
xnoremap , ;

xmap <silent> K <Plug>SchleppIndentDown
xmap <silent> <silent> L <Plug>SchleppIndentUp

xmap <silent> <Left> <Plug>SchleppLeft
xmap <silent> <Right> <Plug>SchleppRight
nnoremap <BS> :set hls!<CR>

nmap s <Plug>(SneakStreak)
nmap S <Plug>(SneakStreakBackward)
xmap s <Plug>(SneakStreak)

cnoremap <C-l> <Up>
cnoremap <C-k> <Down>

" To make CTRL-A work on 07
set nrformats-=octal
set ignorecase  smartcase  
set nohlsearch incsearch
set autochdir
set wrap
" set textwidth=80

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

au BufRead,BufNewFile *.md set filetype=markdown
" Sets syntax highlighting for bash_aliases and histor
au BufRead,BufNewFile *.bash* set filetype=sh
cmap H H

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

" USER DEFINED FUNCTIONS

function! MakeNumberedListInLastVisualSelection()
    silent! '<,'>s/*/\=line('.')-line("'<")+1
    silent! %s/(\d\)\./0\1 
endfunction

command! NumberBuffer call MakeNumberedListInLastVisualSelection()

function! OneLineDown ()
    .put=''
endfunction
function! OneLineUp ()
    .-1put=''
endfunction
nnoremap <silent>  :call OneLineDown ()<CR>
nnoremap <silent>  :call OneLineUp ()<CR>

xmap H :norm! @a<CR>
nmap H @:

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

function! DuplicateAndComment ()
    silent! '<,'>t'>
    silent! '<,'>TComment
endfunction
xmap gy :call DuplicateAndComment ()<CR>

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

function! DeleteToOneLine ()
    silent! %s/^\s\+$//
    " http://stackoverflow.com/questions/3032030/how-does-g-j-reduce-multiple-blank-lines-to-a-single-blank-work-in-vi
    silent! g/^$/,/./-j
    silent! normal! 
    echo "Merged all consecutive blank lines"
endfunction

nmap  do :call DeleteToOneLine()<CR>

function! Cbr ()
    Renamer
    %s/ - Imgur//
    %s/zip/cbr
    Ren
endfunction

command! Cbr call Cbr()

nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" To reload in VisualStudio
set autoread

let $ideavimrc = 'C:\Users\Toshiba PC\.ideavimrc'
let $vsvimrc = 'C:\HOME\.vsvimrc'

function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

command! RenameFile call RenameFile()

nnoremap Y y$

function! Correction ()
    stopinsert
    normal! xP
    normal! l
    startinsert
endfunction

inoremap <S-CR> <C-o>:call Correction()<CR>

nnoremap ga :Tab /

nnoremap <space> ,
xnoremap <space> ,
onoremap <space> ,

let $md = $dropbox . '/text/markdown'
let $text = $dropbox . '/text'
let $ftplugin = $configs . '/.vim/ftplugin'

iabbrev arw ->

function! YoManga()
    silent! %s/\[YoManga\]//
    silent! %s/_/ /g
    silent! %s/zip/cbr
endfunction

command! YoManga call YoManga()

onoremap { V{
onoremap } V}

function! MP3TextFileGenerator()
    Renamer
    let @s=''
    g/\.mp3/yank S
    edit temp.txt
    bd VimRenamer
    put=@s
    g/^$/d
    %s/mp3/txt
    %s/ /\\ /g
    %join
    normal! :arga 
    bufdo write
endfunction

command! MP3TextFileGenerator call MP3TextFileGenerator()

cnoremap jk <C-c>

nnoremap U <C-r>

nnoremap yo :silent !pandoc -o paper.html paper.md \| paper.html<CR>

nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'gj'
nnoremap <expr> l (v:count > 1 ? "m'" . v:count : '') . 'gk'

nnoremap <silent> <Space>k :<C-U>VertigoDown n<CR>
vnoremap <silent> <Space>k :<C-U>VertigoDown v<CR>
onoremap <silent> <Space>k :<C-U>VertigoDown o<CR>
nnoremap <silent> <Space>l :<C-U>VertigoUp n<CR>
vnoremap <silent> <Space>l :<C-U>VertigoUp v<CR>
onoremap <silent> <Space>l :<C-U>VertigoUp o<CR>


let g:ctrlp_prompt_mappings = {
    \ 'PrtSelectMove("j")':   ['<c-k>', '<down>'],
    \ 'PrtSelectMove("k")':   ['<c-l>', '<up>'],
    \ 'PrtCurRight()':        [ '<right>'],
    \ }

" %s/\(\u\)\(\u\+\)/\1\L\2/g
