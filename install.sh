#!/bin/bash

SERVICES=(
	"lightdm" 
	"bluetooth"
)

function install_base_packages() {
	echo -e "\n\e[92mInstalling base packages..."
	sudo pacman -S --noconfirm base-devel pkgfile binutils fakeroot git make
}

function install_yay() {
	echo -e "\n\e[92mInstalling Yay..."
	[ -f "$(pwd)/_yay" ] && rm -rf _yay
	git clone https://aur.archlinux.org/yay.git _yay
	cd _yay && makepkg -si --noconfirm
	cd .. && rm -rf _yay
}

function install_packages() {
	echo -e "\n\e[92mInstalling needed packages..."
	yay -S --needed --nocleanmenu --nodiffmenu --noeditmenu --noprovides `cat ./.install/packages`
}

function install_compositor() {
	echo -e "\n\e[92mInstalling compositor..."
	# Installing the compton fork with kawase blur effect
	[ -f "$(pwd)/_compton" ] && rm -rf _compton
	git clone https://github.com/tryone144/compton.git _compton
	cd _compton && make && make docs && make install
	cd .. && rm -rf _compton
}

function link_config() {
	echo -e "\n\e[92mLinking configuration files..."
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
	echo -e "\n\e[92mInstaling Oh My Zsh..."
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

function enable_services() {
	echo -e "\n\e[92mEnabling services..."
	for i in "${SERVICES[@]}"; do
		sudo systemctl enable "$i"
	done
}

function set_shell() {
	sudo chsh -s $(which zsh)
}

function configure_lightdm() {
	# activate the greeter
	echo -e "\n\e[92mConfiguring LightDM..."
	sudo sed -i -i '/greeter-session/c\greeter-session=lightdm-gtk-greeter' /etc/lightdm/lightdm.conf
}

function _install() {
	install_base_packages && \
	install_yay && \
	install_packages && \
	install_compositor && \
	link_config && \
	configure_lightdm && \
	enable_services && \
	install_oh_my_zsh
}

POSITIONAL=()
while [[ $# -gt 0 ]]; do
	case $1 in
		-b|--base)
		install_base_packages
		shift
		shift
		;;
		-y|--yay)
		install_yay
		shift
		shift
		;;
		-p|--packages)
		install_packages
		shift
		shift
		;;
		-c|--install-compositor)
		install_compositor
		shift
		shift
		;;
		-l|--link-config)
		link_config
		shift
		shift
		;;
		-e|--enable-services)
		enable_services
		shift
		shift
		;;
		*)
		_install
		shift
		;;
	esac
done
set -- "${POSITIONAL[@]}" 