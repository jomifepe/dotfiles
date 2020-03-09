# dotfiles
Configuration files for my [Arch Linux](https://www.archlinux.org/) and [i3](https://i3wm.org/)/[bspwm](https://github.com/baskerville/bspwm) environment.  
These directories are organized in a way so that `stow` can make symbolic links to the correct locations on a real installation.

## Installation
Firstly, clone this repo to your home folder.
```bash
git clone https://github.com/jomifepe/dotfiles.git ~/dotfiles

# or without git
cd; curl -L https://github.com/jomifepe/dotfiles/tarball/master | tar -xz && mv jomifepe-* dotfiles
```
### Full installation
```bash
# Do this only in a clean installation
# This is a work in progress, I cannot guarantee that everything will work
./install.sh
```
### Partial installation
Just run the install steps individually
```bash
./install -h # To see the individual steps
```
