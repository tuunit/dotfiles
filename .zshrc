# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel9k/powerlevel9k"

HISTSIZE=1000000000
SAVEHIST=1000000000
HIST_STAMPS="yyyy-mm-dd"

plugins=(git)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)
source $ZSH/oh-my-zsh.sh

# hgit as a git alias for the home directory
alias hgit='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Auto load ssh session using keychain
eval `keychain --eval id_rsa`

# Always start a tmux session
if [ "$TMUX" = "" ]; then tmux; fi

export GPG_TTY=$(tty)

# Initialize nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Initialize workspace environment
export WORKSPACE_DIRECTORY=/workspace

# Neovim as default editor
export EDITOR='nvim'

# Always use vim with the pages / tabs parameter
alias vim='vim -p'

# Always open the current directory when just typing 'code'
alias code="code ."

# Quick and dirty upgrade
alias upgrade="sudo apt update && sudo apt upgrade -yq && flatpak update -y"

# Custom devcontainer method for starting devcontainers from the cli
devcontainer() {
    cd /workspace/dev-setup/devcontainers/$1
    /usr/bin/code --folder-uri "$(python3 /workspace/dev-setup/make_devcontainer_folder_uri.py)"
}

# Custom devcontainer zsh autocompletion
_devcontainer() {
    local -a container

    container=($(ls /workspace/dev-setup/devcontainers))
    _describe 'command' container
}

compdef _devcontainer devcontainer

# go version management
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"
