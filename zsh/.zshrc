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
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

HISTSIZE=1000000000
SAVEHIST=1000000000
HIST_STAMPS="yyyy-mm-dd"

plugins=(git)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)
source $ZSH/oh-my-zsh.sh

# Auto load ssh session using keychain
eval `keychain --eval id_rsa`
export GPG_TTY=$(tty)

# Initialize nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/google-cloud-sdk/path.zsh.inc' ]; then . '/opt/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/google-cloud-sdk/completion.zsh.inc' ]; then . '/opt/google-cloud-sdk/completion.zsh.inc'; fi

# go version management
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

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
export WORKSPACE_DIRECTORY=/workspace

# Neovim as default editor
export EDITOR='nvim'

# Always use vim with the pages / tabs parameter
alias vim='vim -p'
alias vimg="git status --porcelain | awk '{print \$2}' | xargs vim -p"
function vimdiff() {
  git diff --name-only "$1" | xargs vim -p
}

# Always open the current directory when just typing 'code'
alias code="code ."

# Quick and dirty upgrade
alias upgrade="sudo apt update && sudo apt upgrade -y && flatpak update -y && sudo apt autoremove -y"

# Replace ls with exa
alias ls="eza"
alias ll="eza -alh"
alias tree="eza --tree"

# Replace cat with bat
alias cat="batcat"
alias copper="cat -l yaml"
