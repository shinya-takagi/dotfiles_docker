# -----------------------------
# Alias
# -----------------------------
#
# Global alias (can set alias of pipeline)
alias -g L="| less"
alias -g H="| head"
alias -g G="| grep"
alias -g gr="| grep --color"
alias -g GI="| grep -ri"

# local alias
alias ls="ls --color=auto"
[[ $(type lsd) ]]; alias ls="lsd"   # Use lsd instead of ls if installed.
alias lst="ls -ltr"
alias la="ls -la"
alias ll="ls -l"
alias ltr="ls -lrt"
alias lh="ls -lh"

alias du="du -h"
alias df="df -h"
alias su="su -l"
alias so="source"
alias c="cd"
alias cp="cp -i"
alias rm="rm -i"
alias rmf="rm -f"
alias mkdir="mkdir -p"
alias ..="c ../"
alias back="pushd"
alias diff="diff -U1"

if [ -e "$HOME/pass.sh" ]; then
  alias sshp="sshpass -p $(sh ~/pass.sh) ssh"
fi

#------git------------
alias gs="git status"
alias ga="git add"
alias gb="git branch"
alias gco="git checkout"
alias gcm="git commit -a -m"
alias gp="git push"
alias gpm="gp origin master"

alias et="exit"
alias rl="readlink -f"
alias dc="cd"
alias sl="ls"

#-------URL--------------------------
# Open command
#   For WSL
if [[ "$(uname -r)" == *microsoft* ]];  then 
   alias open="wsl-open"
   alias xdg-open="wsl-open"
fi
if type open >/dev/null 2>&1; then
  alias ggr="open http://google.com/"
  alias tube="open https://www.youtube.com"
  alias github="open https://www.github.com"
  alias twit="open https://www.twitter.com"
  alias insta="open https://www.instagram.com"
  alias qiita="open https://qiita.com"
fi

# Vim
alias vi="vim"
alias vr="vi ~/.vimrc"
alias svr="source ~/.vimrc"
[[ -a /usr/bin/nvim ]] && alias vi="nvim"
# LunarVim https://github.com/LunarVim/LunarVim
[[ -a $HOME/.local/bin/lvim ]] && alias vi="lvim"; alias nv="nvim"

# tmux
#alias tma="tmux attach"
#alias tml="tmux list-window"

# zsh
alias vz="vi ${ZDOTDIR}/.zshrc"
alias va="vi ${ZDOTDIR}/alias.zsh"
alias vp="vi ${ZDOTDIR}/.zprofile"
alias ve="vi ${ZDOTDIR}/.zshenv"
alias vl="vi ${ZDOTDIR}/.zlogout"
alias sz="source ${ZDOTDIR}.zshrc"
alias sa="source ${ZDOTDIR}alias.zsh"

# python
alias py="python3"

# TeX
alias lmk="latexmk -pvc -output-directory=out"
alias lmkc="latexmk -c"
alias lmklua="latexmk -gg -pdflua -pvc -output-directory=out" 

#-------------------------------
#	FUNCTION
#-------------------------------
function hoge (){
    echo "This function is hoge."
}
