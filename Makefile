default: install-yay install-packages link-config install-oh-my-fish set-shell install-nerd-fonts

install-yay:
	sudo pacman -S yay

install-packages:
	./install-packages.sh

link-config:
	./link-config.sh

set-shell:
	chsh -s `which fish`

install-oh-my-fish:
	./install-oh-my-fish.sh

install-nerd-fonts:
	./install-nerd-fonts.sh