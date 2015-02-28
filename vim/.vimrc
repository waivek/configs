" put this line first in ~/.vimrc
set nocompatible | filetype indent plugin on | syn on 
" Shows commands
set showcmd
" Incremental Search
set incsearch
"Shows commands

map <Leader>b @b
map <Leader>f H\\f

map <Leader>t :call Toggle()<CR>
" Same as let mapleader = " " but space shows in showcmd
map <space> <Leader>
" let mapleader = " "
nmap <Leader>a :vs %:p:h/code/01/%:.<CR> 
nmap <Leader>z :sp $vimsnip/c.snippets<CR>
nmap <Leader>q :set nohls!<CR>
nmap <Leader>r :w<CR>:source %<CR>

map <Leader>u :call UpdateHeaderFile()<CR>
map <Leader>h :call CreateHeaderFile()<CR>

nmap <Leader>v :vs 
nmap <Leader>s :sp 

nmap hh :help 
nnoremap hv tH
nnoremap hs tK
map he :e!#<CR>

noremap j h
noremap k j
noremap l k
noremap ; l

nnoremap <Leader>j <C-W>h
nnoremap <Leader>k <C-W>j
nnoremap <Leader>l <C-W>k
nnoremap <Leader>; <C-W>l

map <Leader>o <C-W>o
map <Leader>c <C-W>c
map <Leader>x <C-W>x

map <Leader>n :bn<CR>
map <Leader>p :bp<CR>
map <Leader>d :bd<CR>

map <Leader>w :w<CR>
map <Leader>e :e 
map <Leader>3 :e#<CR>

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

colorscheme  molokai
" Sets color of lineno columns same as molokai background
hi LineNr ctermbg = 235
" All Lines Without Text (New File) now have same color as lines with text
hi NonText ctermbg = 235

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
call SetupVAM()

VAMActivate vim-snippets 
VAMActivate snipmate 
VAMActivate tComment 
VAMActivate EasyMotion
" TODO: Install vim with python support
" ==================VIMSCRIPT FUNCTIONS===============================
source $dropbox/vimscripts/header_plugin.vim
source $dropbox/vimscripts/toggle_plugin.vim
