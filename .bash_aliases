alias b='vim ~/.bash_aliases'
alias f='cd $dropbox/cpp/object-oriented-programming'
alias c='cd $dropbox/c/oop_c/'
alias t='vim $dropbox/to-do.md'
alias song='youtube-dl -x -a ~/Desktop/songs.txt'
# alias tmux='tmux -2'
alias p='xdg-open /media/common/Videos/Archive/Google\ IO\ Talks/Files/Video/NewEarth'
# alias nvim='TERM=xterm-256color nvim'

export dropbox='/media/common/Dropbox'
export configs="${dropbox}/Public/configs/vim"
# export foo="${dropbox}/sh/foo.sh"
# export websc="${dropbox}/python/Webscraping"
# export vimtmp='/home/shree/.vim/vimtmp'
# export vimsnip='/home/shree/.vim/vim-addons/vim-snippets/snippets'
export shell_scripts="${dropbox}/sh"
export vimsc="$dropbox/vimscripts"
c_down() 
{
    cmd="~/Desktop/C+$+/object-oriented-programming/stopwatch $1; exec $SHELL";
    gnome-terminal --geometry 25x2+1360+0 -x bash -c $cmd
}
