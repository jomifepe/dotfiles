default: install-base-packages install-yay install-packages link-config install-oh-my-zsh set-shell

install-base-packages:
	sudo pacman -S --noconfirm base-devel pkgfile binutils fakeroot git make

install-yay:
	git clone https://aur.archlinux.org/yay.git
	cd yay && makepkg -si --noconfirm
	cd .. && rm -rf yay

install-packages:
	./.install/install-packages.sh

install-compton:
	# Installing the compton fork with kawase blur effect
	git clone https://github.com/tryone144/compton.git
	cd compton && make && make docs && make install
	cd .. && rm -rf compton

link-config:
	./.install/link-config.sh

set-shell:
	chsh -s $(which zsh)

install-oh-my-zsh:
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

enable-services:
	./.install/enable-services.sh