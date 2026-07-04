sudo pacman -Sy brave-browser stow ripgrep btop fzf eza keychain qt5-wayland neovim bat vlc syncthing obsidian gimp docker docker-compose containerd base-devel git git-delta yq jq tree-sitter-cli archlinux-keyring

sudo pacman-key --populate

git clone https://github.com/go-nv/goenv.git ~/.goenv
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
chsh -s $(which zsh)

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
