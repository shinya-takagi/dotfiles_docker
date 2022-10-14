# .bashrc

# Source global definitions
#if [ -f /etc/bashrc ]; then
#    . /etc/bashrc
#fi

# export PROMPT_COMMAND="source $HOME/.bashrc"
if [ -f $HOME/.git-completion.bash ]; then
    source $HOME/.git-completion.bash
fi
if [ -f $HOME/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
#   export GIT_STATUS=$(__git_ps1)
fi
export GIT_STATUS="$(__git_ps1 "(%s)") "
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto
#----Git------------<  
P_RED="\[\033[01;31m\]"
P_GREEN="\[\033[01;32m\]"
P_YELLOW="\[\033[01;33m\]"
P_BLUE="\[\033[01;34m\]"
P_MAGENTA="\[\033[01;35m\]"
P_CYAN="\[\033[01;36m\]"
P_WHITE="\[\033[00m\]"
NOW_TIME="<$(date +"%Y/%m/%d %p %I:%M:%S")>"
if [ "$(echo $GIT_STATUS | grep "+")" ]; then 
    export PS1="$P_BLUE \w "$P_RED"$GIT_STATUS"$P_WHITE""$NOW_TIME"\n"$P_WHITE" $ "
elif [ "$(echo $GIT_STATUS | grep "%")" ]; then 
    export PS1="$P_BLUE \w "$P_YELLOW"$GIT_STATUS"$P_WHITE""$NOW_TIME"\n"$P_WHITE" $ "
elif [ "$(echo $GIT_STATUS | grep "*")" ]; then 
    export PS1="$P_BLUE \w "$P_YELLOW"$GIT_STATUS"$P_WHITE""$NOW_TIME"\n"$P_WHITE" $ "
else
    GIT_STATUS=""
    export PS1="$P_BLUE \w "$P_GREEN"$GIT_STATUS"$P_WHITE""$NOW_TIME"\n"$P_WHITE" $ "
fi

# ---PROMPT------------<

export EDITOR=vim
set -o vi
bind 'set show-mode-in-prompt on'

# alias list
# basic command
alias ls="ls --color=auto"
alias cp="cp -b -i"
alias dcp="cp -rbi"
alias rm="rm -i"
alias et="exit"
alias rl="readlink -f"
# change directory to dot
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."

# ls
alias ll="ls -l"
alias llh="ls -lh"
alias la="ls -a" 
alias lt="llh -t"
alias ltr="llh -rt"
alias lls="llh -S"
alias llsr="llh -Sr"

# Vim
alias vi="vim"
alias vbp="vim ~/.bash_profile"
alias sbp="source ~/.bash_profile"
alias vb="vim ~/.bashrc"
alias sb="source ~/.bashrc"
alias vr="vi ~/.vimrc"
alias sr="source ~/.vimrc"

# C++
alias g++="g++ -std=c++0x"

# Others
alias dvi="vi -d"
alias cemacs="emacs -nw"
alias py="python"

# Git command
alias ga="git add"
alias gs="git status"
