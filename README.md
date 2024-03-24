# tuunit's dotfiles

## New system setup

```bash
# Setup alias for h(ome)git
echo "alias hgit='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> ~/.zshrc

# Clone dotfiles
git clone --bare git@github.com:tuunit/dotfiles.git $HOME/.cfg

# Ignore the dotfiles bare repo
echo ".cfg" >> .gitignore

# Don't show untracked files
hgit config --local status.showUntrackedFiles no
```
