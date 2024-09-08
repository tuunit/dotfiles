sudo apt install stow

# Activate configs using stow
for package in */; do
    stow $package
done

sudo apt install -yq kitty thunar zsh

git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
chsh -s $(which zsh)

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
