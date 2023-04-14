# color for directories
LS_DIR_COLOR="di=1;34:"
LS_COLORS=$LS_COLORS$LS_DIR_COLOR

# set terminal title
PROMPT_COMMAND='echo -ne "\033]0;$(pwd)\007"'

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias idea='~/Downloads/idea-IU-222.4345.14/bin/idea.sh > /dev/null 2> /dev/null &'
alias ll='ls -alhtF'
alias lynx='lynx -vikeys'
alias la='ls -A'
alias l='ls -CF'
alias gitlog='git log --graph --oneline --pretty=short'
alias vim='vim'
alias vi='vifm'

set -o vi

blk='\[\033[01;30m\]'   # Black
red='\[\033[01;31m\]'   # Red
grn='\[\033[01;32m\]'   # Green
ylw='\[\033[01;33m\]'   # Yellow
blu='\[\033[01;34m\]'   # Blue
pur='\[\033[01;35m\]'   # Purple
cyn='\[\033[01;36m\]'   # Cyan
wht='\[\033[01;37m\]'   # White
clr='\[\033[00m\]'      # Reset

function git_branch() {
  printf "%s" "$(git branch 2> /dev/null | awk '/\*/{print $2}')";
}

function bash_prompt(){
  PS1=${ylw}'\h ${debian_chroot:+($debian_chroot)}'${blu}'('${red}'$(git_branch)'${blu}')'${pur}' \w'${grn}' \$ '${clr}
}
bash_prompt
