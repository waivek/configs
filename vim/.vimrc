" TODO: Install vim with python support
" TODO: LOOK AT WINDOWS PLUGINS FOR MORE INFORMATION (JSHINT)
" put this line first in ~/.vimrc
set nocompatible | filetype indent plugin on | syn on 
" Shows commands
    " set statusline+=%#warningmsg#
    " set statusline+=%{SyntasticStatuslineFlag()}
    " set statusline+=%*
set showcmd
" Incremental Search
set incsearch
"Shows commands

set textwidth=80

" Disables annoying bells in gvim
set noeb vb t_vb=
" Removes right-scrollbar(r) 
" Removes menu(T) 
" Removes left-scrollbar (L)
if has("win32")
endif

" TODO: Unify paths by making a function that substitues '\' for '/'
" TODO: and another function to do the opposite.

cabbrev h tab help
cabbrev help tab help

" TODO: Remove functions. Do purely via {rhs}
function! HorizontalToVertical()
    normal! tH
endfunction
function! VerticalToHorizontal()
    normal! tK
endfunction
cabbrev h2v :call HorizontalToVertical()<CR>
cabbrev v2h :call VerticalToHorizontal()<CR>

noremap j h
noremap k j
noremap l k
noremap ; l

" Same as let mapleader = " " but space shows in showcmd
map <space> <Leader>
" let mapleader = " "

nnoremap <Leader>j <C-W>h
nnoremap <Leader>k <C-W>j
nnoremap <Leader>l <C-W>k
nnoremap <Leader>; <C-W>l
nnoremap <Leader>o <C-W>o
nnoremap <Leader>c <C-W>c
nnoremap <Leader>x <C-W>x

nnoremap <Leader>N :bN<CR>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>d :bd<CR>

nnoremap <Leader>w :w<CR>
nnoremap <Leader>e :e#<CR>

nnoremap <Leader>h :cd %:h<CR>

nnoremap <Leader><space> :

nnoremap <Leader>a :Git add %:p<CR><CR>
nnoremap <Leader>q :set nohls!<CR>

nnoremap <Leader>t :NERDTreeToggle<CR>

nnoremap <Leader>v tH
nnoremap <Leader>s tK

nnoremap hh ;


nnoremap hn :AsyncCommand node bin/www<CR>
nnoremap ho :call MakeSpace('below')<CR>
nnoremap hO :call MakeSpace('above')<CR>
" TODO: Fix these three plugins
" au FileType c, cpp map hu :silent! call UpdateHeaderFile()<CR>
" au FileType c, cpp map hc :silent! call CreateHeaderFile()<CR>
" au FileType c, cpp map ht :call Toggle()<CR>
nnoremap h; ;
au FileType vim map hb :call A()<CR>
au FileType vim nmap hr :w<CR>:source %<CR>
au FileType c,cpp map hb <F7>

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

colorscheme  molokai

" set scrolloff=20
" Ensures that cursor stays at middle of the screen.

" set hlsearch
" " Sets the highlight search

" FILE SPECIFIC SETTINGS

" FILE SPECIFIC SETTINGS C/C++
au FileType c,cpp map <F9> :w\|!$shell_scripts/build.sh %:r<CR>
au FileType c,cpp map <F8> :w\|!$shell_scripts/build.sh %:r
au FileType c,cpp map <F7> :w\|!$shell_scripts/foo.sh %:r<CR>
au FileType c,cpp set formatoptions-=r
au FileType c,cpp set formatoptions-=o
" Build tool for C/C++

" FILE SPECIFIC SETTINGS MAKE
" Necessary for make
au FileType make set noexpandtab

" FILE SPECIFIC SETTINGS PYTHON
au FileType python map <F9> :w\|!python %:p<CR>
" Build tool for Python

" FILE SPECIFIC SETTINGS PERL
au FileType perl map <F9> :w\|!perl %:p<CR>
" Build tool for Perl

" FILE SPECIFIC SETTINGS MARKDOWN
au BufRead,BufNewFile *.md set filetype=markdown
au FileType markdown set com=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,b:-
au FileType markdown set formatoptions+=o
au FileType markdown set formatoptions+=r
" Plugin to assist in literate programming
au FileType markdown source $dropbox\vimscripts\markdown_code_extractor.vim
au FileType markdown map hw :call CreateNewSourceFile()<CR>:e#<CR>:execute "normal! 3<C-O>"<CR>
" Automatically sets syntax highlighting for .md files
" au BufRead,BufNewFile *.md set formatoptions+=r

" FILE SPECIFIC SETTINGS HASKELL
au FileType haskell nnoremap hc :call InsertHaskellCommentHeader()<CR>

" FILE SPECIFIC SETTINGS BASH
au BufRead,BufNewFile *.bash* set filetype=sh
" Sets syntax highlighting for bash_aliases and histor

if has("win32")

    " GUI OPTIONS
    set guioptions-=r
    set guioptions-=T
    set guioptions-=L
    set guifont=Consolas:h11:cANSI

    " JSLint Setup
    let g:syntastic_javascript_jshint_exec = 'C:\Program Files\JSLint\jsl-0.3.0\jsl.exe'
    let g:syntastic_javascript_checkers = ['jsl']

    source $dropbox\vimscripts\insert_three_lines_and_start_in_middle_plugin.vim

    " PATH VARIABLES
    let $dropbox = 'X:\Dropbox'
    let $vimrc = $dropbox . '\Public\configs\vim\.vimrc'
    let $haskell = $dropbox . '\haskell'
    let $configs = $dropbox . '\Public\configs'
    let $vimsnips = $configs . '\vim\.vim\vim-addons\vim-snippets\snippets'
    let $spanish = $dropbox . '\js\spanish'
    let $vimsnips = $configs . '\vim\.vim\vim-addons\vim-snippets\snippets'
    let $jsnips = $configs . '\vim\.vim\vim-addons\vim-snippets\snippets\javascript'
endif

if has("unix")

    "PATH VARIABLES
    let $dropbox = '/media/sf_Dropbox'
    let $haskell = $dropbox . '/haskell'
    let $configs = $dropbox . '/Public/configs/'
    let $vimsnips = $configs . '/vim/.vim/vim-addons/vim-snippets/snippets'

    " COLORSCHEME MOLOKAI SETTINGS
    " Sets color of lineno columns same as molokai background
    hi LineNr ctermbg = 235
    " All Lines Without Text (New File) now have same color as lines with text
    hi NonText ctermbg = 235
endif

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
    VAMActivate unite
    VAMActivate fugitive
    VAMActivate markdown@tpope
    VAMActivate AsyncCommand
" ==================VIMSCRIPT FUNCTIONS===============================
    source $dropbox/vimscripts/header_plugin.vim
    source $dropbox/vimscripts/toggle_plugin.vim
    source $dropbox/vimscripts/install_plugin.vim
    source $dropbox/vimscripts/insert_three_lines_and_start_in_middle_plugin.vim
endif
if has("win32")
    execute 'cd' "C:\\Users\\Toshiba PC\\Desktop"
    let g:vim_addon_manager = {}
    " for windows users, see 
    " https://github.com/MarcWeber/vim-addon-manager/issues/111
    fun! MyPluginDirFromName(name)
      let dir = vam#DefaultPluginDirFromName(a:name)
      return substitute(dir,'%','_', 'g')
    endf
    let g:vim_addon_manager['plugin_dir_by_name'] = 'MyPluginDirFromName'
    " use either windows or linux location - whichever exists
    exec 'set runtimepath+='.filter([$HOME.'\.vim', $HOME.'\vimfiles'],'isdirectory(v:val)')[0].'\vim-addons\vim-addon-manager'
    exec 'set runtimepath+=$HOME'
    call vam#ActivateAddons(["EasyMotion"], {'auto_install' : 1})
    call vam#ActivateAddons(["tComment"], {'auto_install' : 1})
    call vam#ActivateAddons(["vim-snippets"], {'auto_install' : 1})
    call vam#ActivateAddons(["vim-snippets"], {'auto_install' : 1})
    call vam#ActivateAddons(["snipmate"], {'auto_install' : 1})
    call vam#ActivateAddons(["tComment"], {'auto_install' : 1})
    call vam#ActivateAddons(["EasyMotion"], {'auto_install' : 1})
    call vam#ActivateAddons(["The_NERD_tree"], {'auto_install' : 1})
    call vam#ActivateAddons(["Syntastic"], {'auto_install' : 1})
    call vam#ActivateAddons(["unite"], {'auto_install' : 1})
    call vam#ActivateAddons(["fugitive"], {'auto_install' : 1})
    call vam#ActivateAddons(["markdown@tpope"], {'auto_install' : 1})
    call vam#ActivateAddons(["AsyncCommand"], {'auto_install' : 1})

endif


" ==================VIMSCRIPT FUNCTIONS===============================
function! GetFilePathWithExtension()
    return expand('%:p')
endfunction
function! InsertHaskellCommentHeader()
    let b:x = '--file: ' . GetFilePathWithExtension() 
    :0put=b:x
    normal! G
    :startinsert
endfunction
function! A()
    let @a=""
    normal! 2o
    normal! "ayy
    normal! P
    :startinsert
endfunction
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
    
