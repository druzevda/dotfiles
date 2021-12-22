# my settings
PS1='${debian_chroot:+($debian_chroot)}\[\e[1;35m\]$(pwd)\[\033[00m\] '

# color for directories
LS_DIR_COLOR="di=1;34:"
LS_COLORS=$LS_COLORS$LS_DIR_COLOR

# set terminal title
PROMPT_COMMAND='echo -ne "\033]0;$(pwd)\007"'
