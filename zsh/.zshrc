if [ "$TERM_PROGRAM" = "vscode" ]; then
  export TERM="xterm-256color"
else
  export TERM="screen-256color"
fi
# Always start a tmux session
if [ -z "$TMUX" ]; then
  #exec tmux new-session -A -s workspace
  exec tmux
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.pub-cache/bin:$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

HISTSIZE=1000000000
SAVEHIST=1000000000
HIST_STAMPS="yyyy-mm-dd"

plugins=(git)
source $ZSH/oh-my-zsh.sh

# Auto load ssh session using keychain
eval `keychain --eval id_ed25519`
export GPG_TTY=$(tty)

# Initialize nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# go version management
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"

install-go() {
  [[ -z "$1" ]] && echo "Usage: install-go <version>" && return 1
  cd "$GOENV_ROOT/plugins/go-build/../.." && git pull && cd - || return 1
  goenv install "$1" || return 1
  goenv global "$1" || return 1
  eval "$(goenv init -)"
  export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"
  install-go-tools
}

# Custom devcontainer method for starting devcontainers from the cli
# devcontainer() {
#     cd /workspace/dev-setup/devcontainers/$1
#     /usr/bin/code --folder-uri "$(python3 /workspace/dev-setup/make_devcontainer_folder_uri.py)"
# }
# 
# # Custom devcontainer zsh autocompletion
# _devcontainer() {
#     local -a container
# 
#     container=($(ls /workspace/dev-setup/devcontainers))
#     _describe 'command' container
# }

# compdef _devcontainer devcontainer

# Initialize workspace environment
if [[ "$(uname -s)" == "Darwin" ]]; then
  export WORKSPACE_DIRECTORY=/Users/tuunit/workspace
else
  export WORKSPACE_DIRECTORY=/workspace
fi

# Neovim as default editor
export EDITOR='nvim'

# Always use vim with the pages / tabs parameter
alias vim='nvim'
alias vimg="git status --porcelain | awk '{print \$2}' | xargs vim -p"
function vimdiff() {
  git diff --name-only "$1" | xargs vim -p
}

# Quick and dirty upgrade
if [[ "$(uname -s)" == "Darwin" ]]; then
  alias upgrade="brew update && brew upgrade && (cd ~/.oh-my-zsh/ && git pull && cd custom/themes/powerlevel10k/ && git pull)"
else
  alias upgrade="sudo apt update && sudo apt upgrade -y && flatpak update -y && sudo apt autoremove -y && (cd ~/.oh-my-zsh/ && git pull && cd custom/themes/powerlevel10k/ && git pull)"
fi

# Always open the current directory when just typing 'code'
alias code="code ."

# Replace ls with exa
alias ls="eza"
alias ll="eza -alh"
alias tree="eza --tree"

# Replace cat with bat
if [[ "$(uname -s)" == "Darwin" ]]; then
  alias cat="bat"
else
  alias cat="batcat"
fi
alias copper="cat -l yaml"

# kubectl completion
source <(kubectl completion zsh)
