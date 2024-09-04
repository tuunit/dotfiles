sudo apt install stow

# Activate configs using stow
for package in */; do
    stow $package
done
