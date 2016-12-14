" Plugins  {{{2
set nocompatible
set runtimepath+=X:\Dropbox\Public\configs\vim\.vim\dein\repos\github.com\Shougo\dein.vim
set runtimepath+=/X/Dropbox/Public/configs/vim/.vim/dein/repos/github.com/Shougo/dein.vim
call dein#begin( 'X:\Dropbox\Public\configs\vim\.vim\dein\' )
    call dein#add('Shougo/dein.vim')
    call dein#add('ap/vim-buftabline')
    call dein#add( 'wellle/targets.vim' )
    " call dein#add('tpope/vim-fugitive', { 'if' : 0, 'on_cmd': [ 'Git', 'Gstatus', 'Gwrite', 'Glog', 'Gcommit', 'Gblame', 'Ggrep', 'Gdiff', ]})
    call dein#add('tpope/vim-fugitive')
    call dein#add('justinmk/vim-sneak', {'on_map' : ['<Plug>SneakLabel_s', '<Plug>SneakLabel_S']})
    call dein#add('tomtom/tcomment_vim', {'on_map': 'gc', 'on_cmd' : 'TComment'})
    call dein#add('kien/ctrlp.vim', { 'on_cmd' : 'CtrlPMRUFiles' })
    call dein#add('qpkorr/vim-renamer', { 'on_cmd': 'Renamer'})
    " Not first time
    call dein#add('godlygeek/tabular', { 'on_cmd' : [ 'Tab', 'Tabularize' ] , 'on_map' : 'ga' })
    call dein#add('tommcdo/vim-exchange', { 'on_map' : {'n' : 'cx', 'x' : 'X' } } ) 
    call dein#add('tpope/vim-repeat', {'on_map' : '.'}) 
    call dein#add( 'tpope/vim-surround', {'on_map': {'n' : ['cs', 'ds', 'ys'], 'x' : ['S']}, 'depends' : 'vim-repeat'})
    call dein#add('Raimondi/delimitMate', { 'on_event' : 'InsertEnter', })
    call dein#add('terryma/vim-multiple-cursors', { 'on_map' : { 'n' : ['<C-n>', '<C-p>'], 'x' : '<C-n>'}}) 
    call dein#add('kana/vim-textobj-user')
    call dein#add('glts/vim-textobj-comment', {'on_map' :['<Plug>(textobj-comment-a)', '<Plug>(textobj-comment-i)', '<Plug>(textobj-comment-i)', '<Plug>(textobj-comment-big-a)']}) 
    call dein#add('coderifous/textobj-word-column.vim', {'on_map': {'xo' : ['ic', 'ac']}}) 
    call dein#add('kana/vim-textobj-indent', {'on_map': {'xo' : ['ii', 'ai']}}) 
    call dein#add('zirrostig/vim-schlepp', { 'on_map' :  ['<Plug>SchleppIndentDown', '<Plug>SchleppIndentUp', '<Plug>SchleppLeft', '<Plug>SchleppRight']}) 
    call dein#add('osyo-manga/vim-over', { 'on_cmd' : 'OverCommandLine' }) 
    call dein#add('bps/vim-textobj-python', { 'on_ft' : 'python' }) 
    call dein#add('tmhedberg/matchit', { 'on_ft' : 'html' }) 
call dein#end()

    " }}}2
set nocompatible | filetype indent plugin on | syn on 
colorscheme  molokai
" Plugin Settings {{{2
" === VIM-AIRLINE SETTINGS : START ===
"URL = http://www.4thinker.com/vim-airline.html
" Necessary for vim-ariline to show in normal window
" Otherwise it shows only when we do a split
set laststatus=2
" Shows buffers in tab
" Tabline works when only single tab
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 0
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

let g:ctrlp_prompt_mappings = {
            \ 'PrtSelectMove("j")':   ['<c-k>', '<down>'],
            \ 'PrtSelectMove("k")':   ['<c-l>', '<up>'],
            \ 'PrtCurRight()':        [ '<right>'],
            \ }
" Shows fugitive branch and commit status
set statusline=%<%f\ %h%m%r%{exists('g:loaded_fugitive')?fugitive#statusline():''}%=%-14.(%l,%c%V%)\ %P
" set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}

" }}}2
" Paths " {{{2

if has("win32")
    source $HOME\vimfiles\autoload\pathConverter.vim
endif
if has("unix")
    source $HOME/.vim/autoload/pathConverter.vim
endif

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

let $md = $dropbox . '/text/markdown'
let $text = $dropbox . '/text'
let $ftplugin = $configs . '/.vim/ftplugin'
let $ideavimrc = 'C:\Users\Toshiba PC\.ideavimrc'
let $vsvimrc = 'C:\HOME\.vsvimrc'

" }}}2
" Remaps {{{2
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
xmap <silent> L <Plug>SchleppIndentUp

xmap <silent> <Left> <Plug>SchleppLeft
xmap <silent> <Right> <Plug>SchleppRight
nnoremap <BS> :set hls!<CR>

let g:sneak#label = 1
nmap s <Plug>SneakLabel_s
nmap S <Plug>SneakLabel_S
nmap , <Plug>Sneak_;
xmap , <Plug>Sneak_;

cnoremap <C-l> <Up>
cnoremap <C-k> <Down>

xmap H :norm! @a<CR>
nmap H @:

nnoremap Y y$
nnoremap ga :Tab /

cnoremap jk <C-c>

nnoremap yo :silent !pandoc -o paper.html paper.md \| paper.html<CR>

nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'gj'
nnoremap <expr> l (v:count > 1 ? "m'" . v:count : '') . 'gk'

" nnoremap <silent> <Space>k :<C-U>VertigoDown n<CR>
" vnoremap <silent> <Space>k :<C-U>VertigoDown v<CR>
" onoremap <silent> <Space>k :<C-U>VertigoDown o<CR>
" nnoremap <silent> <Space>l :<C-U>VertigoUp n<CR>
" vnoremap <silent> <Space>l :<C-U>VertigoUp v<CR>
" onoremap <silent> <Space>l :<C-U>VertigoUp o<CR>

onoremap { V{
onoremap } V}

" nnoremap <space> ,
" xnoremap <space> ,
" onoremap <space> ,

iabbrev arw ->

noremap zk zj
noremap zl zk

cabbrev h vertical help
cabbrev help vertical help
" }}}2
" Option Settings {{{2
" To make CTRL-A work on 07
set nrformats-=octal
set ignorecase  smartcase  
set nohlsearch incsearch
set autochdir
set wrap
" set textwidth=80

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
" Sets syntax highlighting for bash_aliases and history
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
if has("nvim")
    " Prevents terminal buffer from being deleted once it's window closes
    autocmd TermOpen * set hidden
endif

let g:space_loaded = 1

" }}}2
" User Defined Functions {{{2
function! Number()
    silent! '<,'>s/^/\=line('.')-line("'<")+1
endfunction
command! Number call Number()

function! OneLineDown ()
    .put=''
endfunction
function! OneLineUp ()
    .-1put=''
endfunction
nnoremap <silent>  :call OneLineDown ()<CR>
nnoremap <silent>  :call OneLineUp ()<CR>

" if !exists("*AddNewPlugin")
"     function! AddNewPlugin ()
"         ?^Plugin
"         .t.
"         normal! wdi'"+P
"         write
"         source %
"         PluginInstall
"     endfunction
"     command! AddNewPlugin call AddNewPlugin()
" endif

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

" function! Cbr ()
"     Renamer
"     %s/ - Imgur//
"     %s/zip/cbr
"     Ren
" endfunction
" command! Cbr call Cbr()

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

function! Correction ()
    stopinsert
    normal! xP
    normal! l
    startinsert
endfunction

inoremap <S-CR> <C-o>:call Correction()<CR>

" function! YoManga()
"     silent! %s/\[YoManga\]//
"     silent! %s/_/ /g
"     silent! %s/zip/cbr
" endfunction
" command! YoManga call YoManga()

" function! MP3TextFileGenerator()
"     Renamer
"     let @s=''
"     g/\.mp3/yank S
"     edit temp.txt
"     bd VimRenamer
"     put=@s
"     g/^$/d
"     %s/mp3/txt
"     %s/ /\\ /g
"     %join
"     normal! :arga 
"     bufdo write
" endfunction
" command! MP3TextFileGenerator call MP3TextFileGenerator()

" SOME SHIT IS HERE
function! FixCase()
    " silent! '<,'>s/^/\=line('.')-line("'<")+1
    silent! '<,'>s/\(\u\)\(\u\+\)/\1\L\2/g
endfunction
command! FC call FixCase()

" }}}2
" vim: foldmethod=marker
