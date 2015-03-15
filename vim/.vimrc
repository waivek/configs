" TODO: Install vim with python support
" put this line first in ~/.vimrc
set nocompatible | filetype indent plugin on | syn on 
" Shows commands
    " set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    "set statusline+=%*
set showcmd
" Incremental Search
set incsearch
"Shows commands

" Same as let mapleader = " " but space shows in showcmd
map <space> <Leader>
" let mapleader = " "
" nmap <Leader>a :vs %:p:h/code/01/%:.<CR> 
nmap <Leader>q :set nohls!<CR>

map <Leader>t :NERDTreeToggle<CR>

nnoremap <Leader>v tH
nnoremap <Leader>s tK
cabbrev h tab help

" TODO: Remove functions. Do purely via {rhs}
function! HorizontalToVertical()
    normal! tH
endfunction
function! VerticalToHorizontal()
    normal! tK
endfunction
cabbrev h2v :call HorizontalToVertical()<CR>
cabbrev v2h :call VerticalToHorizontal()<CR>

map hu :silent! call UpdateHeaderFile()<CR>
map hh :silent! call CreateHeaderFile()<CR>
map ht :call Toggle()<CR>
au FileType vim map hb @b 
" ' r ;  call A()'
au FileType vim nmap hr :w<CR>:source %<CR>
au FileType c,cpp map hb <F7>

noremap j h
noremap k j
noremap l k
noremap ; l

nnoremap <Leader>j <C-W>h
nnoremap <Leader>k <C-W>j
nnoremap <Leader>l <C-W>k
nnoremap <Leader>; <C-W>l
nnoremap <Leader>o <C-W>o
nnoremap <Leader>c <C-W>c
nnoremap <Leader>x <C-W>x

map <Leader>N :bN<CR>
map <Leader>n :bn<CR>
map <Leader>d :bd<CR>

map <Leader>w :w<CR>
map <Leader>e :e#<CR>

map <Leader><space> :

syntax on
set number
autocmd InsertEnter,InsertLeave * set cul!
" Adds a long line to indicate -- INSERT -- mode

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

" im :<CR> :<CR><TAB>
" Detects when you type a colon and press enter. Indents next line
" This is for Python

set pastetoggle=<F10>
" Pressing F10 toogles -- INSERT (paste) --

if has("unix")
    colorscheme  molokai
    " Sets color of lineno columns same as molokai background
    hi LineNr ctermbg = 235
    " All Lines Without Text (New File) now have same color as lines with text
    hi NonText ctermbg = 235
endif
if has("win32")
    colorscheme SolarizedDark
endif

" set scrolloff=20
" Ensures that cursor stays at middle of the screen.

set hlsearch
" Sets the highlight search

au FileType c,cpp map <F9> :w\|!$shell_scripts/build.sh %:r<CR>
au FileType c,cpp map <F8> :w\|!$shell_scripts/build.sh %:r
au FileType c,cpp map <F7> :w\|!$shell_scripts/foo.sh %:r<CR>
au FileType c,cpp set formatoptions-=r
au FileType c,cpp set formatoptions-=o
" Build tool for C/C++
au FileType make set noexpandtab
" Necessary for make

au FileType python map <F9> :w\|!python %:p<CR>
" Build tool for Python

au FileType perl map <F9> :w\|!perl %:p<CR>
" Build tool for Perl

" au FileType markdown map <F9> :w\|!markdown %:p > foo.html\|google-chrome-stable foo.html\| rm foo.html<CR>
" Build tool for markdown

au BufRead,BufNewFile *.md set filetype=markdown
au FileType markdown set com=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,b:-
au FileType markdown set formatoptions+=o
au FileType markdown set formatoptions+=r
" au BufRead,BufNewFile *.md set formatoptions+=r
" Automatically sets syntax highlighting for .md files

au BufRead,BufNewFile *.bash* set filetype=sh
" Sets syntax highlighting for bash_aliases and histor

" hi Normal ctermbg=NONE
" Makes Vim Transparent

set relativenumber
" Sets relative line numbers

set backupdir=~/.vim/vimtmp,.
set directory=~/.vim/vimtmp,.

" Fixes backspace inside insert mode
set backspace=indent,eol,start

" Splits properly
set splitright

fun! SetupVAM()
    let c = get(g:, 'vim_addon_manager', {})
    let g:vim_addon_manager = c
    let c.plugin_root_dir = expand('$HOME', 1) . '/.vim/vim-addons'
    " most used options you may want to use:
    " let c.log_to_buf = 1
    " let c.auto_install = 0
    let &rtp.=(empty(&rtp)?'':',').c.plugin_root_dir.'/vim-addon-manager'
    if !isdirectory(c.plugin_root_dir.'/vim-addon-manager/autoload')
      execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '
          \       shellescape(c.plugin_root_dir.'/vim-addon-manager', 1)
    endif

    " This provides the VAMActivate command, you could be passing plugin names, too
    call vam#ActivateAddons([], {})
endfun

if has("unix")
    call SetupVAM()
    VAMActivate vim-snippets 
    VAMActivate snipmate 
    VAMActivate tComment 
    VAMActivate EasyMotion
    VAMActivate The_NERD_tree
    VAMActivate Syntastic
" ==================VIMSCRIPT FUNCTIONS===============================
    source $dropbox/vimscripts/header_plugin.vim
    source $dropbox/vimscripts/toggle_plugin.vim
endif
if has("win32")
    let g:vim_addon_manager = {}
    " for windows users, see https://github.com/MarcWeber/vim-addon-manager/issues/111
    fun! MyPluginDirFromName(name)
      let dir = vam#DefaultPluginDirFromName(a:name)
      return substitute(dir,'%','_', 'g')
    endf
    let g:vim_addon_manager['plugin_dir_by_name'] = 'MyPluginDirFromName'
    " use either windows or linux location - whichever exists
    " exec 'set runtimepath+='.filter([$HOME.'\.vim', $HOME.'\vimfiles'],'isdirectory(v:val)')[0].'\vim-addons\vim-addon-manager'
    " let path="C:\\Users\\Toshiba PC\\AppData\\Roaming\\SPB_16.6\\.vim\\vim-addons\\vim-addon-manager"
    " exec 'set runtimepath+=' . path
    " exec 'set runtimepath+=$HOME'
    " call vam#ActivateAddons(["tComment"], {'auto_install' : 1})
endif

" ==================VIMSCRIPT FUNCTIONS===============================
" source $dropbox/vimscripts/header_plugin.vim
" source $dropbox/vimscripts/toggle_plugin.vim
function! A()
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
    
