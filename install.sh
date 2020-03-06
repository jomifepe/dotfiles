#!/bin/bash

SERVICES=(
	"lightdm" 
	"bluetooth"
)

function install_base_packages() {
	sudo pacman -S --noconfirm base-devel pkgfile binutils fakeroot git make
}

function install_yay() {
	[ -f "$(pwd)/_yay" ] && rm -rf _yay
	git clone https://aur.archlinux.org/yay.git _yay
	cd _yay && makepkg -si --noconfirm
	cd .. && rm -rf _yay
}

function install_packages() {
	yay -S --needed `cat ./.install/packages`
}

function install_compositor() {
	# Installing the compton fork with kawase blur effect
	[ -f "$(pwd)/_compton" ] && rm -rf _compton
	git clone https://github.com/tryone144/compton.git _compton
	cd _compton && make && make docs && make install
	cd .. && rm -rf _compton
}

function link_config() {
	COMMAND='stow --adopt --target=$HOME -R `ls -d */`'
	eval "$COMMAND -nv"

	printf "\n\e[96mDo you want do perform this changes? (y/n): \e[39m"
	read CONFIRMATION

	if [ "${CONFIRMATION^^}" == "Y" ]; then
		eval "$COMMAND"
		printf "\e[92m✓ Done\n\e[39m"
	fi
}

function install_oh_my_zsh() {
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

function enable_services() {
	for i in "${SERVICES[@]}"; do
		sudo systemctl enable "$i"
	done
}

function set_shell() {
	sudo chsh -s $(which zsh)
}

function configure_lightdm() {
	# activate the greeter
	sudo sed -i -i '/greeter-session/c\greeter-session=lightdm-gtk-greeter' /etc/lightdm/lightdm.conf
}

function _install() {
	install_base_packages && \
	install_yay && \
	install_packages && \
	install_compositor && \
	install_oh_my_zsh && \
	link_config && \
	set_shell && \
	configure_lightdm && \
	enable_services
}

_install