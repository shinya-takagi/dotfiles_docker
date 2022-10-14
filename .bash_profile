# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs
# User specific aliases and functions
ulimit -s unlimited
# eval `dircolors $HOME/.dircolors-solarized/dircolors.ansi-dark_taka`

export PATH="$HOME/.local/bin:$PATH"

