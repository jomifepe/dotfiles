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
# To see the individual steps
./install.sh -h
```

## More Information

## [sxhkd](https://github.com/baskerville/sxhkd)

### sxhkd is a simple X hotkey daemon, by the developer of bspwm, that reacts to input events by executing commands.

### Why use this?

This daemon allows users to share common hotkeys between different window managers, providing some modularity. For example, [i3](https://build.i3wm.org/docs/i3-msg.html) hotkeys are usually define on its configuration file, but they can be executed using the `i3-msg` command, so it's possible have all its hotkeys on a wm specific `sxhkd` config file. These files can then be combine by using the following command:

```
sxhkd -c COMMON_CONFIG WM_SPECIFIC_CONFIG
```