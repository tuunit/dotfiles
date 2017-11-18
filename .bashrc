# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -1 --group-directories-first --color=auto'
    alias la='ls -lhaG --color=always | sed -re "s/^[^.]* //"'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [[ ! $TERM =~ screen ]]; then
    # always enable color
	export TERM="xterm-256color"
    # always start tmux
	exec tmux -2
fi

# old unix terminal style line prompt without folder and user name
export PS1="\$ "

# add uncrustify config
export PATH=$PATH:/home/tuunit/.uncrustify.cfg

# always us vim with open tabs parameter
alias vim='vim -p'

# load additional aliases and exports
if [ -f ~/.bash_extras ]; then
    source ~/.bash_extras
fi
