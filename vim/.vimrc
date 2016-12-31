" Plugins  {{{1

set nocompatible
if has("gui_running")
set runtimepath+=X:\Dropbox\Public\configs\vim\.vim\dein\repos\github.com\Shougo\dein.vim
call dein#begin( 'X:\Dropbox\Public\configs\vim\.vim\dein\' )
    call dein#add('Shougo/dein.vim')
    call dein#add('ap/vim-buftabline')
    call dein#add('wellle/targets.vim')
    call dein#add('SirVer/ultisnips' ,  {'on_map' : { 'i' : ['<TAB>'] }})
    call dein#add('tpope/vim-fugitive', { 'on_cmd': [ 'Git', 'Gstatus', 'Gwrite', 'Glog', 'Gcommit', 'Gblame', 'Ggrep', 'Gdiff', ] })
    call dein#add('justinmk/vim-sneak', {'on_map' : ['<Plug>SneakLabel_s', '<Plug>SneakLabel_S']})
    call dein#add('tomtom/tcomment_vim', {'on_map': 'gc', 'on_cmd' : 'TComment'})
    call dein#add('kien/ctrlp.vim', { 'on_cmd' : 'CtrlPMRUFiles' })
    call dein#add('qpkorr/vim-renamer', { 'on_cmd': 'Renamer'})
    " Not first time
    call dein#add('godlygeek/tabular', { 'on_cmd' : [ 'Tab', 'Tabularize' ] , 'augroup' : 'tabular' })
    call dein#add('tommcdo/vim-exchange', { 'on_map' : {'n' : 'cx', 'x' : 'X' } } ) 
    call dein#add('tpope/vim-repeat', {'on_map' : '.'}) 
    call dein#add('tpope/vim-surround', {'on_map': {'n' : ['cs', 'ds', 'ys'], 'x' : 'S'}, 'depends' : 'vim-repeat'})
    call dein#add('Raimondi/delimitMate', { 'on_event' : 'InsertEnter', })
    call dein#add('Raimondi/delimitMate', {'on_map' : { 'i' : ['(', '[', '{' ] }})
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
endif
    " }}}1
set nocompatible | filetype indent plugin on | syntax on 
if has("gui_running")
    colorscheme  molokai
endif
" Plugin Settings {{{1
" {{{2 Ulti Snips
let g:UltiSnipsJumpForwardTrigger = "<C-k>"
let g:UltiSnipsJumpBackwardTrigger = "<C-l>"
" }}}2
" DelimitMate {{{2
let delimitMate_expand_cr = 1
let delimitMate_expand_space=1
let delimitMate_jump_expansion = 1
" }}}2
let g:multi_cursor_exit_from_insert_mode = 0
" textobj-comment {{{2
" To prevent map conflict with textobj-column
let g:textobj_comment_no_default_key_mappings = 1
xmap ax <Plug>(textobj-comment-a)
omap ax <Plug>(textobj-comment-a)
xmap ix <Plug>(textobj-comment-i)
omap ix <Plug>(textobj-comment-i)
xmap aX <Plug>(textobj-comment-big-a)
omap aX <Plug>(textobj-comment-big-a)
" }}}2
" CtrlP {{{2
let g:ctrlp_prompt_mappings = {
            \ 'PrtSelectMove("j")':   ['<c-k>', '<down>'],
            \ 'PrtSelectMove("k")':   ['<c-l>', '<up>'],
            \ 'PrtCurRight()':        [ '<right>'],
            \ }
nnoremap cm :CtrlPMRUFiles<CR>
" }}}2
set statusline=%<%f\ %h%m%r%{exists('g:loaded_fugitive')?fugitive#statusline():''}%=%-14.(%l,%c%V%)\ %P
" Schlepp {{{2
xmap <silent> K <Plug>SchleppIndentDown
xmap <silent> L <Plug>SchleppIndentUp
xmap <silent> <Left> <Plug>SchleppLeft
xmap <silent> <Right> <Plug>SchleppRight
" }}}2
" Sneak {{{2
let g:sneak#label = 1
nmap s <Plug>SneakLabel_s
nmap S <Plug>SneakLabel_S
nmap , <Plug>Sneak_;
xmap , <Plug>Sneak_;
" }}}2
let g:buftabline_numbers=1
let g:dein#install_process_timeout=600
" }}}1
" Paths " {{{1
if has("gui_running")
if has("win32")
    source $HOME\vimfiles\autoload\pathConverter.vim
endif
if has("unix")
    source $HOME/.vim/autoload/pathConverter.vim
endif
endif

let $dropbox = 'X:\Dropbox'
if has("unix")
    let $dropbox = '/mnt/x/Dropbox'
endif
let $vimrc = $dropbox . '\Public\configs\vim\.vimrc'
let $configs = $dropbox . '\Public\configs\vim'
let $commonvimrc = $configs . '\.commonvimrc'
let $desktop = 'C:\Users\Toshiba PC\Desktop'
" Necessary for plugins requiring python
let $pythonhome = 'C:\Python27'
if has("gui_running")
if has("unix")
    let $vimrc = ConvertWin32ToUnix($vimrc)
    let $configs = ConvertWin32ToUnix($configs)
    let $commonvimrc = ConvertWin32ToUnix($commonvimrc)
endif
endif

if has("unix")
    set backupdir=~/.vim/vimtmp,.
    set directory=~/.vim/vimtmp,.
endif
if has("win32")
    set backupdir=~\vimfiles\vimtmp,.
    set directory=~\vimfiles\vimtmp,.
endif
let $ftplugin = $configs . '/.vim/ftplugin'
let $ideavimrc = 'C:\Users\Toshiba PC\.ideavimrc'
let $vsvimrc = $dropbox . '\Public\configs\vim\.vsvimrc'
let $ideavimrc = '\Public\configs\vim\.ideavimrc'
" }}}1
" Remaps {{{1
inoremap jk 
xnoremap jk 
cnoremap jk <C-c>

" https://www.reddit.com/r/vim/comments/3n97ug/its_been_a_long_while_since_ive_discovered/cvm0y66
inoremap <expr> <c-y> pumvisible() ? "\<c-y>" : matchstr(getline(line('.')-1), '\%' . virtcol('.') . 'v\%(\k\+\\|.\)')
inoremap <expr> <c-e> pumvisible() ? "\<c-e>" : matchstr(getline(line('.')+1), '\%' . virtcol('.') . 'v\%(\k\+\\|.\)')

noremap j h
noremap k gj
noremap l gk
noremap ; l
onoremap k j
onoremap l k

nnoremap <C-w>j <C-w>h
nnoremap <C-w>k <C-w>j
nnoremap <C-w>l <C-w>k
nnoremap <C-w>; <C-w>l

nnoremap <C-w>J <C-w>H
nnoremap <C-w>K <C-w>J
nnoremap <C-w>L <C-w>K
nnoremap <C-w>: <C-w>L

nnoremap <C-TAB> :bn<CR>
nnoremap <C-S-TAB> :bp<CR>

nnoremap cd :silent! :!cmd .<CR>

nnoremap h "+
xnoremap h "+

nnoremap , ;
xnoremap , ;

nnoremap <BS> :set hls!<CR>

cnoremap <C-l> <Up>
cnoremap <C-k> <Down>

xmap H :norm! @a<CR>
nmap H @:

nnoremap Y y$

nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'gj'
nnoremap <expr> l (v:count > 1 ? "m'" . v:count : '') . 'gk'

iabbrev arw ->

noremap zk zj
noremap zl zk

cabbrev h vertical help
cabbrev help vertical help

if v:servername=="VS" 
    set autoread
    nnoremap <Space> :w<CR>
endif
if v:servername=="IJ"
    set autoread
    set autowrite
    nnoremap <Space> :w<CR>
endif

" }}}1
" Option Settings {{{1
" To make CTRL-A work on 07
set nrformats-=octal
set ignorecase  smartcase  
set nohlsearch incsearch
set autochdir
set wrap
set number
set smartindent " Automatically indents when and where required
set tabstop=4 " Sets tab width to 4 
set shiftwidth=4 " Allows you to use < and > keys in -- VISUAL --
set expandtab " Inserts 4 spaces when <TAB> is pressed
set softtabstop=4 " Makes vim see four spaces as a <TAB>
set relativenumber " Sets relative line numbers
set backspace=indent,eol,start " Fixes backspace inside insert mode
set splitright " Splits properly

au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.bash* set filetype=sh
au BufRead,BufNewFile *.ps1 set filetype=powershell

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
    set guifont=Powerline_Consolas:h11:cANSI
endif

set laststatus=2
" }}}1
" User Defined Functions {{{1
function! Number()
    silent! '<,'>s/^/\=line('.')-line("'<")+1
endfunction
command! Number call Number()

nnoremap <silent>  :.put=''<CR>
nnoremap <silent>  :.-1put=''<CR>

function! DuplicateAndComment (...)
    let sel_save = &selection
    let &selection = "inclusive"
    let reg_save = @@
    if !a:0
        silent exe "normal! gvy"
    endif

    silent! :'[,']t'[-1
    silent :'[,']TComment
    silent! :']+1

    let &selection = sel_save
    let @@ = reg_save
endfunction
nmap <silent> gy :set opfunc=DuplicateAndComment<CR>g@
vmap <silent> gy :<C-U>call DuplicateAndComment()<CR>

function! DeleteToOneLine ()
    silent! %s/^\s\+$//
    " http://stackoverflow.com/questions/3032030/how-does-g-j-reduce-multiple-blank-lines-to-a-single-blank-work-in-vi
    silent! g/^$/,/./-j
    silent! normal! 
    echo "Merged all consecutive blank lines"
endfunction
nmap  do :call DeleteToOneLine()<CR>

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

" Some Shit Is Here
function! FixCase()
    " silent! '<,'>s/^/\=line('.')-line("'<")+1
    silent! '<,'>s/\v(\u)(\u+)/\1\L\2/g
endfunction
command! FC call FixCase()

" }}}1
" vim: foldmethod=marker
